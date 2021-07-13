require "test_case/active_admin/base_test_case"

class BatchActionSelectorTest < ActiveAdmin::BaseTestCase
  def default_css_classes
    @default_css_classes ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:css_classes, :table_tools)
  end

  def modal_dialog_config
    @modal_dialog_config ||= {
      buttons: {
        ok: {
          text: "OK",
          class: default_css_classes.dig(:modal_dialog, :ok)
        },
        cancel: {
          text: "Cancel",
          class: default_css_classes.dig(:modal_dialog, :cancel)
        }
      }
    }
  end

  def escape_config(config)
    CGI.escapeHTML(config.to_json)
  end

  setup do
    @component = render_arbre_component({modal_dialog_config: modal_dialog_config}) do
      batch_action_selector [
        ActiveAdmin::BatchAction.new(:action_1, "Action 1", {modal_dialog: modal_dialog_config}),
        ActiveAdmin::BatchAction.new(:action_2, "Action 2", {modal_dialog: modal_dialog_config}),
        ActiveAdmin::BatchAction.new(:action_3, "Action 3", {modal_dialog: modal_dialog_config})
      ]
    end
  end

  test "#html" do
    html =
      <<~ERB
        <div class="batch_actions_selector dropdown_menu dropdown">
          <a class="disabled #{default_css_classes[:btn]} dropdown-toggle dropdown_menu_button" data-bs-toggle="dropdown" href="#">Batch Actions</a>
          <ul class="dropdown_menu_list dropdown-menu">
            <li><a class="dropdown-item batch_action" data-action="action_1" data-inputs="null" data-aa-modal-dialog="#{escape_config(modal_dialog_config)}" href="#">Action 1 Selected</a></li>
            <li><a class="dropdown-item batch_action" data-action="action_2" data-inputs="null" data-aa-modal-dialog="#{escape_config(modal_dialog_config)}" href="#">Action 2 Selected</a></li>
            <li><a class="dropdown-item batch_action" data-action="action_3" data-inputs="null" data-aa-modal-dialog="#{escape_config(modal_dialog_config)}" href="#">Action 3 Selected</a></li>
          </ul>
        </div>
      ERB
    assert_html html, @component
  end
end
