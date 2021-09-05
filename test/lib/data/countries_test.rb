require "test_helper"

class Adminterface::Data::CountriesTest < ActiveSupport::TestCase
  def described_class
    Adminterface::Data::Countries
  end

  test "returns correct keys" do
    countries = described_class.call(:en)
    keys = countries.map(&:keys).flatten.uniq
    assert keys.include?(:code)
    assert keys.include?(:name)
    assert keys.include?(:translated_name)
  end

  test "returns error if country_select not installed" do
    klass = Class.new described_class do
      define_method(:plugin_missing?) { true }
    end

    countries = klass.call(:en)
    assert_equal "#{described_class}::PluginMissing", countries[:error]
  end
end
