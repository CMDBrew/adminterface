module Adminterface
  module Extensions
    module Views
      module Pages
        module Base
          def build(*args)
            super
            set_attribute :dir,
              render_or_call_method_or_proc_on(self, active_admin_config.lang_dir(self))
            build_breakpoint_helpers
            build_meta_tags_for_js
          end

          private

          def build_meta_tags_for_js
            div id: "meta-tags-for-js" do
              meta name: "countries", content: ::Adminterface::Data::Countries.call(I18n.locale).to_json
              meta name: "time_zones", content: ::Adminterface::Data::TimeZones.call(I18n.locale).to_json
              meta name: "translations", content: I18n.t("active_admin").to_json
              meta name: "components", content: {inputs: inputs_components}.to_json
              meta name: "css_classes", content: {confirm_dialog: confirm_dialog_css_classes}.to_json
            end
          end

          def build_breakpoint_helpers
            div id: "breakpoint-helpers" do
              span class: "breakpoint-up-helper"
              span class: "breakpoint-down-helper"
            end
          end

          def build_page
            within body(class: body_classes) do
              header(active_admin_namespace, current_menu)
              title_bar(active_admin_namespace, title, action_items_for_action)

              div id: "wrapper" do
                build_flash_messages
                build_unsupported_browser
                build_page_content
              end
            end
          end

          def build_page_content
            div id: "active_admin_content" do
              build_left_sidebar_content
              build_body_content
              build_right_sidebar_content
            end
          end

          def build_body_content
            div main_html_options do
              div class: content_wrapper_class do
                build_main_content_wrapper
                footer active_admin_namespace
              end
            end
          end

          def build_left_sidebar_content
            return if skip_left_sidebar?

            div sidebar(sidebar_sections_for_action_for_position("left"), class: "container"), id: "sidebar-left"
          end

          def build_right_sidebar_content
            return if skip_right_sidebar?

            div sidebar(sidebar_sections_for_action_for_position("right"), class: "container"), id: "sidebar-right"
          end

          def skip_left_sidebar?
            skip_sidebar? || sidebar_sections_for_action_for_position("left").empty?
          end

          def skip_right_sidebar?
            skip_sidebar? || sidebar_sections_for_action_for_position("right").empty?
          end

          def sidebar_sections_for_action_for_position(position)
            sections = sidebar_sections_for_action.select { |x| x.position.eql?(position) }
            sections += sidebar_sections_for_action.select { |x| x.position.blank? } if sidebar_position.eql?(position)
            sections
          end

          def body_classes
            super.add "#{html_css_classes[:body]} layout-navigation-#{header_position} #{sidebar_class}".squish
          end

          def sidebar_class
            classes = []
            classes.push "with-left-sidebar" unless skip_left_sidebar?
            classes.push "with-right-sidebar" unless skip_right_sidebar?
            classes.push "without-sidebar" if classes.empty?
            classes.join(" ")
          end

          def build_flash_messages
            return if flash_messages.blank?

            div class: "flashes" do
              flash_messages.each do |type, messages|
                [*messages].each do |message|
                  div class: "flash flash_#{type} alert #{flash_css_classes[type.to_sym]} #{flash_dismissible_class}".squish,
                      role: "alert" do
                    text_node(message)
                    button(class: "btn-close", "data-bs-dismiss": "alert", "aria-label": "Close") if flash_dismissible?
                  end
                end
              end
            end
          end

          def flash_dismissible?
            flash_components[:dismissible].eql?(true)
          end

          def flash_dismissible_class
            return unless flash_dismissible?
            "alert-dismissible"
          end

          def main_html_options
            options = config[:main] || {}
            options[:class] = "#{sidebar_class} #{options[:class]}".squish
            options[:id] = "main"
            options
          end

          def content_wrapper_class
            klass =
              case self.class.to_s
              when "ActiveAdmin::Views::Pages::Index"
                html_css_classes.dig(:container, :index)
              when "ActiveAdmin::Views::Pages::Form"
                html_css_classes.dig(:container, :form)
              when "ActiveAdmin::Views::Pages::Show"
                html_css_classes.dig(:container, :show)
              when "ActiveAdmin::Views::Pages::Page"
                html_css_classes.dig(:container, :page)
              end
            klass || "container"
          end

          def sidebar_position
            sidebar_components[:position]
          end

          def header_position
            header_components[:position]
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/pages/base.rb
ActiveAdmin::Views::Pages::Base.class_eval do
  include Adminterface::Configs::Finders
  prepend Adminterface::Extensions::Views::Pages::Base
  has_css_classes_for :html, :flash, :confirm_dialog
  has_components_for :flash, :sidebar, :header, :inputs
end
