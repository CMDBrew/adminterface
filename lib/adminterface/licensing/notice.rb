module Adminterface
  module Licensing
    class Notice
      extend Adminterface::Callable
      attr_reader :response, :external, :endpoint

      def initialize(response, external: true, endpoint: nil)
        @response = response
        @external = external
        @endpoint = endpoint
      end

      def call
        return unless Rails.env.development?

        log("==============================")
        log(heading)
        log(body)
        log("==============================")
      end

      private

      def log(*msgs)
        msgs.each { |x| puts(x) }
      end

      def attributes
        response
          .slice(:adminterface_version, :license, :license_key, :app_name)
          .sort.to_h
      end

      def external?
        !!external
      end

      def heading(title = "Adminterface:")
        return title unless external?

        ["#{title} verifying license on #{endpoint}", verified]
      end

      def verified
        if !!response[:verified]
          Rainbow("[#{response[:status]}] License verified").green
        else
          Rainbow("[#{response[:status]}] #{response[:error]}").red
        end
      end

      def body
        attributes
          .reject { |_k, v| v.blank? }
          .map { |k, v| "* #{k}: #{v}" }
      end
    end
  end
end
