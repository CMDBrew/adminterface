require "test_helper"

module Encryption
  class EncryptorTest < ActiveSupport::TestCase
    def described_class
      Adminterface::Encryption::Encryptor
    end

    def base64?(value)
      value.is_a?(String) && Base64.encode64(Base64.decode64(value)).eql?(value)
    end

    test "encrypts message" do
      message = "test"
      encrypted_message = described_class.call(message)
      assert_not_equal message, encrypted_message
      assert_not_equal message, Base64.decode64(encrypted_message)
    end

    test "returns encrypted message in base64 format" do
      message = "test"
      encrypted_message = described_class.call(message)
      assert base64?(encrypted_message)
    end

    test "uses a public key" do
      service = described_class.new("test")
      refute service.send(:public_key).private?
    end
  end
end
