# Overwrite activeadmin/lib/active_admin/inputs/filters/select_input.rb
ActiveAdmin::Inputs::Filters::SelectInput.class_eval do
  prepend ::ActiveAdminBootstrap::Extensions::Inputs::SelectInput
end
