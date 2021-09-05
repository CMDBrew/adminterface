# Overwrite activeadmin/lib/active_admin/inputs/filters/boolean_input.rb
ActiveAdmin::Inputs::Filters::BooleanInput.class_eval do
  prepend ::Adminterface::Extensions::Inputs::SelectInput
end
