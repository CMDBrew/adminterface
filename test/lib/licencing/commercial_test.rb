require "test_helper"

module Licensing
  module CommercialTest
    extend ActiveSupport::Concern

    def described_class
      Adminterface::Licensing::Commercial
    end

    def response
      @response ||= VCR.use_cassette(cassette_path) { service.call }
    end

    def service
      @service ||= described_class.new(license_key)
    end

    included do
      test "sends correct license_key" do
        assert_equal license_key, service.payload[:license_key]
      end

      test "sends correct license" do
        assert_equal "commercial", service.payload[:license]
      end

      test "sends with verified equals to false" do
        assert_equal false, service.payload[:verified]
      end
    end

    class_methods do
      def setup_with(cassette:, license_key:)
        define_method :cassette_path do
          "test/support/vcr/licensing/commerical/#{cassette}"
        end

        define_method :license_key do
          license_key
        end
      end
    end
  end

  class InvalidLicenseTest < ActiveSupport::TestCase
    include CommercialTest
    setup_with cassette: "invalid", license_key: "INVALID_KEY"

    test "returns status 404" do
      assert_equal 404, response[:status]
    end

    test "returns verified equals to false" do
      assert_equal false, response[:verified]
    end
  end

  class ValidLicenseTest < ActiveSupport::TestCase
    include CommercialTest
    setup_with cassette: "valid", license_key: "VALID_KEY"

    test "returns status 200" do
      assert_equal 200, response[:status]
    end

    test "returns verified equals to true" do
      assert_equal true, response[:verified]
    end
  end
end
