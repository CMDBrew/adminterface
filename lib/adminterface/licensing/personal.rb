require_relative "./base"

module Adminterface
  module Licensing
    class Personal < Base
      private

      def request?
        false
      end
    end
  end
end
