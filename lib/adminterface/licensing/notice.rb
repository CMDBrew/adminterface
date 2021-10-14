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

        [title, "=> Verifying license on #{endpoint}", verified]
      end

      def verified
        if !!response[:verified]
          Rainbow("=> [#{response[:status]}] License verified").green
        else
          Rainbow("=> [#{response[:status]}] #{response[:error]}").red
        end
      end
    end
  end
end
