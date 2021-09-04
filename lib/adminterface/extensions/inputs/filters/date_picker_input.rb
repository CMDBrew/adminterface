# Overwrite activeadmin/lib/active_admin/inputs/filters/date_picker_input.rb
ActiveAdmin::Inputs::Filters::DatePickerInput.class_eval do
  prepend ::Adminterface::Extensions::Inputs::DatePickerInput
end
