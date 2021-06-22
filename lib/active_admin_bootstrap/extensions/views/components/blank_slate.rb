module ActiveAdminBootstrap
  module Extensions
    module Views
      module Components
        module BlankSlate
          def default_class_name
            "#{super} #{blank_slate_css_classes}".squish
          end
        end
      end
    end
  end
end

# Overwrite lib/active_admin/views/components/blank_slate.rb
ActiveAdmin::Views::BlankSlate.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::Components::BlankSlate
  has_css_classes_for :blank_slate
end
