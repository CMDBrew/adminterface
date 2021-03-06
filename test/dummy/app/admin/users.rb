ActiveAdmin.register User do
  menu priority: 4
  config.per_page = [10, 30]
  config.comments_per_page = 5
  # config.css_classes = YAML.load_file(Rails.root.join("config/adminterface/users/css_classes.yml").to_s)
  config.components = {
    header: {position: "top"},
    filter: {position: "sidebar"},
    action_items: {new: {icon_class: "bi-plus"}}
  }

  permit_params :name, :email, :password, :biography,
    user_addresses_attributes: %i[
      position _destroy id fullname address_line1 address_line2
      city state zip_code country
    ]

  filter :name
  filter :email
  filter :created_at

  batch_action :update, form: {
    name: :string,
    updated_at: :datetime_picker
  }, confirm_dialog: {
    buttons: {
      confirm: {class: "btn btn-danger", text: "Confirm!!!"}
    }
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
    actions(dropdown: true)
  end

  show do
    panel do
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
    if f.object.new_record?
      panel do
        f.inputs do
          columns do
            column(span: 6) { f.input :name }
            column(span: 6) { f.input :email }
          end

          f.input :password, password_visibility: true, input_html: {autocomplete: "new-password"}
          f.input :biography, input_counter: true
        end
      end
    else
      tabs http: true do
        tab :profile do
          panel do
            f.inputs do
              columns do
                column(span: 6) { f.input :name }
                column(span: 6) { f.input :email }
              end

              f.input :password, password_visibility: true, input_html: {autocomplete: "new-password"}
              f.input :biography, input_counter: true
            end
          end
        end

        tab :addresses do
          panel do
            f.inputs do
              f.has_many :user_addresses, allow_destroy: true, sortable: :position, sortable_start: 1 do |k|
                k.inputs(class: "row") do
                  k.input :fullname, wrapper_html: {class: "col-lg-6"}
                end +
                  k.inputs(class: "row") do
                    k.input :address_line1, wrapper_html: {class: "col-lg-6"}
                    k.input :address_line2, wrapper_html: {class: "col-lg-6"}
                    k.input :city
                    k.input :state
                    k.input :zip_code
                    k.input :country
                  end
              end
            end
          end
        end
      end
    end

    f.actions
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
