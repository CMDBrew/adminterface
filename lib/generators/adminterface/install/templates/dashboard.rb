ActiveAdmin.register_page "Dashboard" do
  menu priority: 1

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "alert alert-info" do
      h4 I18n.t("active_admin.dashboard_welcome.welcome"), class: "alert-heading"
      para I18n.t("active_admin.dashboard_welcome.call_to_action").html_safe
      hr
      para I18n.t("active_admin.dashboard_welcome.footnote").html_safe, class: "mb-0"
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end
end
