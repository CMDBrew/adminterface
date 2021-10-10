require "test_helper"

module Licensing
  class PersonalTest < ActiveSupport::TestCase
    def described_class
      Adminterface::Licensing::Personal
    end

    def response
      @response ||= service.call
    end

    def service
      @service ||= described_class.new(nil)
    end

    test "sends correct license_key" do
      assert_nil service.payload[:license_key]
    end

    test "sends correct license" do
      assert_equal "personal", service.payload[:license]
    end

    test "returns without status" do
      assert_nil response[:status]
    end

    test "returns verified equals to true" do
      assert_equal true, response[:verified]
    end
  end
end
