ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # filter :name, as: :range

  form do |f|
    f.inputs do
      f.input :biography, as: :rich_text
      f.input :name, as: :color, label: "color"
      f.input :name, as: :boolean, label: "boolean"
      f.input :name, as: :switch, label: "switch"
      f.input :name, as: :datalist, collection: %w[a b], floating: true, label: "datalist"
      f.input :name, as: :email, floating: true, label: "email"
      f.input :name, as: :password, floating: true, label: "password"
      f.input :name, as: :search, floating: true, label: "search"
      f.input :name, as: :url, floating: true, label: "url"
      f.input :name, as: :range, label: "range"
      f.input :name, as: :phone, floating: true, label: "phone"
      f.input :name, as: :radio, collection: %w[a b], inline: true, label: "radio"
      f.input :name, as: :check_boxes, collection: %w[a b], inline: true, label: "check_boxes"
      f.input :name, as: :string, floating: true, label: "string"
      f.input :name, as: :select, collection: %w[mary john], floating: true, label: "select"
      f.input :name, as: :tom_select, collection: %w[mary john], label: "tom_select (single)"
      f.input :name, as: :tom_select, collection: %w[mary john], label: "tom_select (multiple)", multiple: true
      f.input :name, as: :number, floating: true, label: "nummber"
      f.input :created_at, as: :date_picker, floating: true, label: "date_picker"
      f.input :created_at, as: :datepicker, floating: true, label: "datepicker"
      f.input :created_at, as: :time_picker, floating: true, label: "time_picker"
      f.input :created_at, as: :datetime_picker, floating: true, label: "datetime_picker"
    end
    f.actions
  end
end
