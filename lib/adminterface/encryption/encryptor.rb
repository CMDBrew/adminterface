module Adminterface
  module Encryption
    class Encryptor
      extend Callable
      attr_reader :message

      def initialize(message)
        @message = message
      end

      def call
        Base64.encode64(public_key.public_encrypt(message))
      end

      private

      def public_key_file
        @public_key_file ||= File.read(Engine.root.join("lib/adminterface/public.pem"))
      end

      def public_key
        @public_key ||= OpenSSL::PKey::RSA.new(public_key_file)
      end
    end
  end
end
