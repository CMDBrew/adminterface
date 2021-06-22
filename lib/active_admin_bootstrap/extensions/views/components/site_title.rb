module ActiveAdminBootstrap
  module Extensions
    module Views
      module Components
        module SiteTitle
          def tag_name
            :div
          end

          private

          def title_image
            helpers.image_tag(site_title_image, class: "image", alt: title_text)
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
  end
end

# Overwrite lib/active_admin/views/components/site_title.rb
ActiveAdmin::Views::SiteTitle.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::Components::SiteTitle

  def build(namespace)
    super(class: "site_title navbar-brand")
    @namespace = namespace

    div class: "title" do
      site_title_link? ? site_title_with_link : site_title_content
    end
  end
end
