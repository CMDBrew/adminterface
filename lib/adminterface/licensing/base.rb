module Adminterface
  module Licensing
    class Base
      extend Adminterface::Callable

      ENDPOINT = "https://app.adminterface.io/api/v1/licenses/verify".freeze
      CACHE_KEY = "adminterface.licensing.response".freeze
      TIMEOUT = 5

      attr_reader :license_key
      delegate :cache_store, :rails6_and_up?, to: :Adminterface

      def initialize(license_key = Adminterface.license_key)
        @license_key = license_key
      end

      def call
        response = send_and_cache_request.with_indifferent_access
        Adminterface::Licensing::Notice
          .call(response, **{external: request?, endpoint: ENDPOINT})
        response
      end

      def payload
        {
          license_key: license_key,
          license: license,
          adminterface_version: Adminterface::VERSION,
          rails_version: Rails::VERSION::STRING,
          ruby_version: RUBY_VERSION,
          environment: Rails.env,
          app_name: app_name,
          verified: false
        }
      end

      private

      def send_and_cache_request
        return cached_response if has_cached_response?
        return local_response unless request?

        response = HTTParty.post(
          ENDPOINT,
          body: payload.to_json,
          headers: {'Content-type': "application/json"},
          timeout: TIMEOUT
        )

        case response.code
        when 200 then cache_response response.code, response.parsed_response
        else return_error response.code, response.body
        end
      rescue => e
        return_error e.class, e.message
      end

      def local_response
        payload.merge(verified: true)
      end

      def request?
        true
      end

      def return_error(status, exception_message = "")
        payload.merge(status: status, error: exception_message).stringify_keys!
      end

      def cache_response(status, response, time: 1.hour.to_i)
        response = payload.merge!(status: status, expiry: time, **response).stringify_keys!
        cache_store.write(CACHE_KEY, response, expires_in: time)
        response
      end

      def license
        self.class.name.split("::").last.underscore
      end

      def app_name
        klass = Rails.application.class
        rails6_and_up? ? klass.module_parent.name : klass.parent.name
      end

      def has_cached_response?
        cache_store.exist? CACHE_KEY
      end

      def cached_response
        cache_store.read CACHE_KEY
      end
    end
  end
end
