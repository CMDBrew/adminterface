require "test_helper"

class ActiveAdminBootstrap::Data::TimeZonesTest < ActiveSupport::TestCase
  setup do
    @time_zones = ActiveAdminBootstrap::Data::TimeZones.call(:en)
  end

  test "returns correct keys" do
    keys = @time_zones.map(&:keys).flatten.uniq
    assert keys.include?(:identifier)
    assert keys.include?(:name)
    assert keys.include?(:translated_name)
  end
end
