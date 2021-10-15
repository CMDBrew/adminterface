module Adminterface
  class License
    class_attribute :license, default: {}

    class << self
      def verify!
        return if Rails.env.test?

        self.license =
          if ::Adminterface.license_key.present?
            ::Adminterface::Licensing::Commercial
          else
            ::Adminterface::Licensing::Personal
          end.call
      end
    end
  end
end
