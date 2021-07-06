ActiveAdmin.register_page "Dashboard" do
  menu priority: 1

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column(span: 6) do
        panel "Recent Orders" do
          div class: "table-responsive" do
            table_for Order.complete.order("id desc").limit(10) do
              column("State") { |order| status_tag(order.state, class: "badge bg-secondary") }
              column("Customer") { |order| link_to(order.user.email, admin_user_path(order.user)) }
              column("Total") { |order| number_to_currency order.total_price }
            end
          end
        end
      end

      column(span: 6) do
        panel "Recent Customers" do
          div class: "table-responsive" do
            table_for User.order("id desc").limit(10).each do |_user|
              column(:email) { |user| link_to(user.email, admin_user_path(user)) }
            end
          end
        end
      end
    end
  end
end
