# Overwrite activeadmin/lib/active_admin/inputs/filters/check_boxes_input.rb
ActiveAdmin::Inputs::Filters::CheckBoxesInput.class_eval do
  prepend ::ActiveAdminBootstrap::Extensions::Inputs::CheckBoxesInput

  def choices_group_wrapping(&block)
    template.content_tag(:ol, template.capture(&block), choices_group_wrapping_html_options)
  end

  def choice_wrapping(html_options, &block)
    template.content_tag(:li, template.capture(&block), html_options)
  end
end
