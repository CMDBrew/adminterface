require "test_case/active_admin/base_test_case"

class BatchActionSelectorTest < ActiveAdmin::BaseTestCase
  def default_css_classes
    @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :table_tools)
  end

  def confirm_dialog_config
    @confirm_dialog_config ||= {
      buttons: {
        confirm: {
          text: "OK",
          class: default_css_classes.dig(:confirm_dialog, :confirm)
        },
        cancel: {
          text: "Cancel",
          class: default_css_classes.dig(:confirm_dialog, :cancel)
        }
      }
    }
  end

  setup do
    @component = render_arbre_component({confirm_dialog_config: confirm_dialog_config}) do
      batch_action_selector [
        ActiveAdmin::BatchAction.new(:action_1, "Action 1", {confirm_dialog: confirm_dialog_config}),
        ActiveAdmin::BatchAction.new(:action_2, "Action 2", {confirm_dialog: confirm_dialog_config}),
        ActiveAdmin::BatchAction.new(:action_3, "Action 3", {confirm_dialog: confirm_dialog_config})
      ]
    end
  end

  test "#html" do
    html =
      <<~ERB
        <div class="batch_actions_selector dropdown_menu dropdown">
          <a class="disabled #{default_css_classes[:btn]} dropdown-toggle dropdown_menu_button" data-bs-toggle="dropdown" href="#">Batch Actions</a>
          <ul class="dropdown_menu_list dropdown-menu">
            <li><a id="batch-action-action_1" class="dropdown-item batch_action" data-action="action_1" data-inputs="null" data-aa-confirm-dialog="#{escape_hash(confirm_dialog_config)}" href="#">Action 1 Selected</a></li>
            <li><a id="batch-action-action_2" class="dropdown-item batch_action" data-action="action_2" data-inputs="null" data-aa-confirm-dialog="#{escape_hash(confirm_dialog_config)}" href="#">Action 2 Selected</a></li>
            <li><a id="batch-action-action_3" class="dropdown-item batch_action" data-action="action_3" data-inputs="null" data-aa-confirm-dialog="#{escape_hash(confirm_dialog_config)}" href="#">Action 3 Selected</a></li>
          </ul>
        </div>
      ERB
    assert_html html, @component
  end
end
