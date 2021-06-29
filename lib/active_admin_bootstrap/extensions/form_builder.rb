# Overwrite activeadmin/lib/active_admin/form_builder.rb
ActiveAdmin::FormBuilder.class_eval do
  configure :default_text_area_height, 3
end
