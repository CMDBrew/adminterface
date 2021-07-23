require_relative "./base"

module ActiveAdminBootstrap
  module Data
    class Countries < Base
      PluginMissing = Class.new(StandardError)

      attr_reader :locale, :options

      def initialize(locale, options = {})
        @locale = locale
        @options = options
      end

      def call
        raise_error if plugin_missing?
        countries
      end

      private

      def countries
        codes = ISO3166::Country.codes
        codes.map do |code|
          country = ISO3166::Country[code]
          {
            code: code,
            name: country.name,
            translated_name: country.translations[locale.downcase.to_s] || country.name
          }
        end.sort_by { |x| x[:name] }
      end

      def plugin_missing?
        !Object.const_defined?("::CountrySelect")
      end

      def raise_error
        raise PluginMissing,
          "To use the :country input, please install a country_select plugin, like this one: https://github.com/stefanpenner/country_select"
      end
    end
  end
end
