ActiveAdmin.register User do
  menu priority: 4
  config.per_page = [10, 30]

  permit_params :name, :email, :password,
    user_addresses_attributes: %i[
      id fullname address_line1 address_line2 city state zip_code country
    ]

  filter :name
  filter :email
  filter :created_at

  batch_action :flag, form: {
    name: {as: :string},
    updated_at: {as: :date_picker}
  } do |ids, inputs|
    # inputs is a hash of all the form fields you requested
    redirect_to collection_path, notice: [ids, inputs].to_s
  end

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :created_at
    actions
  end

  show do
    panel "Order History" do
      div class: "table-responsive" do
        table_for(user.orders) do
          column("Order", sortable: :id) do |order|
            link_to "##{order.id}", admin_order_path(order)
          end
          column("State") { |order| status_tag(order.state) }
          column("Date", sortable: :checked_out_at) do |order|
            pretty_format(order.checked_out_at)
          end
          column("Total") { |order| number_to_currency order.total_price }
        end
      end
    end

    panel "Address Book" do
      div class: "table-responsive" do
        table_for(user.user_addresses) do
          column("Fullname") do |a|
            link_to a.fullname.to_s, admin_user_user_address_path(user.id, a.id)
          end
          column("Address") do |a|
            span a.address_line1.to_s
            br a.address_line2.to_s
          end
          column :city
          column :state
          column :country
          column :zip_code
          tr class: "action_items" do
            td link_to("New Address", new_admin_user_user_address_path(user), class: :button)
          end
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    panel do
      f.inputs do
        f.input :name
        f.input :password, input_html: {autocomplete: "new-password"}
        f.input :email
        f.has_many :user_addresses, allow_destroy: true, sortable: :position, sortable_start: 1 do |k|
          k.inputs do
            k.input :fullname
            k.input :address_line1
            k.input :address_line2
            k.input :city
            k.input :state
            k.input :zip_code
            k.input :country, as: :string
          end
        end
      end
      f.actions
    end
  end

  sidebar "Customer Details", only: :show do
    attributes_table_for resource, :name, :email, :created_at
  end

  sidebar "Order History", only: :show do
    attributes_table_for resource do
      row("Total Orders") { resource.orders.complete.count }
      row("Total Value") do
        number_to_currency resource.orders.complete.sum(:total_price)
      end
    end
  end
end
