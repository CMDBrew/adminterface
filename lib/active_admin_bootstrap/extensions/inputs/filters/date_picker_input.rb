# Overwrite activeadmin/lib/active_admin/inputs/filters/date_picker_input.rb
ActiveAdmin::Inputs::Filters::DatePickerInput.class_eval do
  prepend ::ActiveAdminBootstrap::Extensions::Inputs::DatePickerInput
end
