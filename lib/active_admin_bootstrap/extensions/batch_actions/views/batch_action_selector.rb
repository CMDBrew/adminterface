module ActiveAdminBootstrap
  module Extensions
    module BatchActions
      module BatchActionSelector
        def dropdown_menu(name, options = {})
          options[:button] ||= {}
          options[:button] = {class: "#{options.dig(:button, :class)} #{table_tools_css_classes[:btn]}".squish}
          super(name, options)
        end

        private

        def build_drop_down
          return if batch_actions_to_display.empty?
          dropdown_menu I18n.t("active_admin.batch_actions.button_label"),
            class: "batch_actions_selector dropdown_menu",
            button: {class: "disabled"} do
            batch_actions_to_display.each do |batch_action|
              confirmation_text = render_or_call_method_or_proc_on(self, batch_action.confirm)

              options = {
                class: "batch_action",
                "data-action": batch_action.sym,
                "data-confirm": confirmation_text,
                "data-inputs": render_in_context(self, batch_action.inputs).to_json,
                "data-aa-modal-dialog": render_in_context(self, batch_action.modal_dialog).to_json
              }

              default_title = render_or_call_method_or_proc_on(self, batch_action.title)
              title = I18n.t("active_admin.batch_actions.labels.#{batch_action.sym}", default: default_title)
              label = I18n.t("active_admin.batch_actions.action_label", title: title)

              item label, "#", **options
            end
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/batch_actions/views/batch_action_selector.rb
ActiveAdmin::BatchActions::BatchActionSelector.class_eval do
  prepend ActiveAdminBootstrap::Extensions::BatchActions::BatchActionSelector
  has_css_classes_for :table_tools
end
