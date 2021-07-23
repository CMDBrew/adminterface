require_relative "./base"

module ActiveAdminBootstrap
  module Data
    class TimeZones < Base
      attr_reader :locale, :options

      def initialize(locale, options = {})
        @locale = locale
        @options = options
      end

      def call
        I18n.with_locale(locale) { time_zones }
      end

      private

      def time_zones
        zones = ActiveSupport::TimeZone.all
        zones.map do |zone|
          {
            identifier: zone.tzinfo.identifier,
            abbreviation: zone.tzinfo.abbreviation,
            name: zone.name,
            translated_name: I18n.t(zone.name, scope: :timezones, default: zone.to_s)
          }
        end
      end
    end
  end
end
