module ActiveAdminBootstrap
  module Extensions
    module FormBuilder
      def semantic_errors(*args)
        return if @object.errors.blank?

        template.content_tag :div, class: form_css_classes[:error] do
          super(*args)
        end
      end

      def field_set_and_list_wrapping(*args, &block)
        # workaround to replace the ol inside the fieldset tag in f.has_many
        fieldset = super
        fieldset.gsub("<ol><div", "<div").gsub("</div></ol>", "</div>").html_safe
      end

      private

      def active_admin_config
        @active_admin_config ||= template.active_admin_config
      end
    end

    module HasManyBuilder
      def initialize(*_args)
        super
        @options[:class] = "#{@options[:class]} #{item_class}".squish
      end

      def render(&block)
        html = "".html_safe
        html << render_heading
        html << template.capture { content_has_many(&block) }
        html = wrap_div_or_li(html)
        template.concat(html) if template.output_buffer
        html
      end

      def render_heading
        return if heading.blank?

        template.content_tag(:div, heading, class: "has-many-heading #{heading_class}")
      end

      def render_has_many_form(form_builder, parent, &block)
        template.concat sortable_action(form_builder)
        template.concat form_fields(form_builder, parent, &block)
      end

      def content_has_many(&block)
        form_block = proc do |form_builder|
          render_has_many_form(form_builder, options[:parent], &block)
        end

        template.assigns[:has_many_block] = true
        contents =
          template.content_tag :div, class: "has-many-list" do
            without_wrapper { inputs(options, &form_block) }
          end.html_safe

        js = new_record ? js_for_has_many(options[:class], &form_block) : ""
        contents << js
      end

      def form_fields(form_builder, parent)
        index = parent && form_builder.send(:parent_child_index, parent)
        template.content_tag :li, class: "has-many-inputs" do
          template.concat(
            template.content_tag(:ol) do
              template.capture { yield(form_builder, index) }
            end
          )
          template.concat form_actions(form_builder)
        end
      end

      def form_actions(form_builder)
        template.content_tag :ol, class: "has-many-actions" do
          template.capture { has_many_actions(form_builder, "".html_safe) }
        end
      end

      def sortable_action(form_builder)
        return unless sortable_column

        form_builder.input sortable_column, as: :hidden
        template.content_tag(:li, "", class: "handle")
      end

      def has_many_actions(form_builder, contents)
        if form_builder.object.new_record?
          contents << template.content_tag(:li) do
            template.link_to I18n.t("active_admin.has_many_remove"), "#",
              class: "button has_many_remove #{destroy_class}".squish
          end
        elsif allow_destroy?(form_builder.object)
          form_builder.input(:_destroy,
            as: :boolean,
            wrapper_html: {class: "button has_many_delete #{destroy_class}".squish},
            label: I18n.t("active_admin.has_many_delete"))
        end

        contents
      end

      def js_for_has_many(class_string, &form_block)
        assoc_name = assoc_klass.model_name
        placeholder = "NEW_#{assoc_name.to_s.underscore.upcase.tr("/", "_")}_RECORD"
        opts = {
          for: [assoc, assoc_klass.new],
          class: class_string,
          for_options: {child_index: placeholder}
        }
        html = template.capture { __getobj__.send(:inputs_for_nested_attributes, opts, &form_block) }
        text = new_record.is_a?(String) ? new_record : I18n.t("active_admin.has_many_new", model: assoc_name.human)

        template.link_to text, "#", class: "button has_many_add #{new_class}", data: {
          html: CGI.escapeHTML(html).html_safe, placeholder: placeholder
        }
      end

      # Force rendering div for the container
      def already_in_an_inputs_block
        false
      end

      private

      def heading_class
        @heading_class ||= form_css_classes.dig(:has_many, :heading)
      end

      def new_class
        @new_class ||= form_css_classes.dig(:has_many, :new)
      end

      def item_class
        @item_class ||= form_css_classes.dig(:has_many, :item)
      end

      def destroy_class
        @destroy_class ||= form_css_classes.dig(:has_many, :destroy)
      end

      def active_admin_config
        @active_admin_config ||= template.active_admin_config
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/form_builder.rb
ActiveAdmin::FormBuilder.class_eval do
  include ActiveAdminBootstrap::Configs::Finders
  prepend ActiveAdminBootstrap::Extensions::FormBuilder
  has_css_classes_for :form
  configure :default_text_area_height, 3
  configure :default_inline_error_class, "inline-errors invalid-feedback"
end

ActiveAdmin::HasManyBuilder.class_eval do
  include ActiveAdminBootstrap::Configs::Finders
  prepend ActiveAdminBootstrap::Extensions::HasManyBuilder
  has_css_classes_for :form
end
