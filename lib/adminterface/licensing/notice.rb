module Adminterface
  module Licensing
    class Notice
      extend Adminterface::Callable
      attr_reader :response, :license_key, :external, :endpoint

      def initialize(response, license_key, external: true, endpoint: nil)
        @response = response
        @license_key = license_key
        @external = external
        @endpoint = endpoint
      end

      def call
        return unless Rails.env.development?

        log("========================================")
        log(messages)
        log("========================================")
      end

      private

      def log(*msgs)
        msgs.each { |x| puts(x) }
      end

      def external?
        !!external
      end

      def title
        "Adminterface #{response[:adminterface_version]} (\"#{response[:license]}\")"
      end

      def messages
        return title unless external?

        [title, "=> Verifying license on #{endpoint}", verified].flatten
      end

      def verified
        if !!response[:verified]
          Rainbow("=> [#{response[:status]}] #{response[:message]}").green
        else
          [
            Rainbow("=> [#{response[:status]}] #{response[:message]}").red,
            Rainbow("=> license_key: #{license_key}").red
          ]
        end
      end
    end
  end
end
