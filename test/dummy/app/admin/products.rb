ActiveAdmin.register Product do
  menu priority: 2
  permit_params :title, :description, :author, :price, :featured, :available_on, :image_file_name, :image

  scope :all, default: true
  scope :available do |products|
    products.where("available_on < ?", Date.today)
  end
  scope :drafts do |products|
    products.where("available_on > ?", Date.today)
  end
  scope :featured_products do |products|
    products.where(featured: true)
  end

  form html: {multipart: true} do |f|
    f.inputs do
      f.semantic_errors

      f.input :featured, as: :switch
      f.input :title
      f.input :description
      f.input :author
      f.input :price
      f.input :available_on, as: :date_picker
      f.input :image, as: :file

      f.actions
    end
  end

  preserve_default_filters!
  remove_filter :image_attachment
  remove_filter :image_blob
  remove_filter :image_file_name

  index do
    selectable_column
    column :title do |product|
      text_node static_or_uploaded_image_tag(product, [32, 32], width: 32, height: 32)
      a truncate(product.title), href: admin_product_path(product)
    end
    column :created_at
    actions(dropdown: true)
  end

  index as: :grid do |product|
    div do
      resource_selection_cell product
      a href: admin_product_path(product) do
        static_or_uploaded_image_tag(product, [115, 115])
      end
    end
    a truncate(product.title), href: admin_product_path(product)
  end

  show title: :title

  sidebar :product_stats, only: :show do
    attributes_table_for resource do
      row("Total Sold") { Order.find_with_product(resource).count }
      row("Dollar Value") { number_to_currency LineItem.where(product_id: resource.id).sum(:price) }
    end
  end

  sidebar :recent_orders, only: :show do
    Order.find_with_product(resource).limit(5).collect do |order|
      auto_link(order)
    end.join(content_tag("br")).html_safe
  end
end
