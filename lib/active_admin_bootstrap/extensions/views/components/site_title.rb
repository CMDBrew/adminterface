module ActiveAdmin
  module Views
    # Overwrite activeadmin/lib/active_admin/views/components/site_title.rb
    class SiteTitle < Component
      def tag_name
        :div
      end

      def build(namespace)
        super(class: "navbar-brand site_title")
        @namespace = namespace

        if site_title_proc?
          div @namespace.site_title_proc.call, class: "title"
        elsif site_title_link?
          div site_title_with_link, class: "title"
        else
          div site_title_content, class: "title"
        end
      end

      private

      def title_image
        helpers.image_tag(site_title_image, class: "image", alt: title_text)
      end

      def site_title_proc?
        @namespace.site_title_proc.present?
      end

      def site_title_content
        if site_title_image.present?
          title_image + helpers.content_tag(:span, title_text)
        else
          title_text
        end
      end
    end
  end
end
