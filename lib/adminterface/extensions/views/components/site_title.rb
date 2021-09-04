module Adminterface
  module Extensions
    module Views
      module Components
        module SiteTitle
          def tag_name
            :div
          end

          def site_title_image
            @site_title_image ||= site_title_image_config
          end

          private

          def title_image
            helpers.image_tag(site_title_image_config, class: "image", alt: title_text)
          end

          def site_title_image_config
            return @namespace.site_title_image(helpers) if logged_in

            @namespace.site_title_image_logged_out(helpers).presence || @namespace.site_title_image(helpers)
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/components/site_title.rb
ActiveAdmin::Views::SiteTitle.class_eval do
  prepend Adminterface::Extensions::Views::Components::SiteTitle
  attr_reader :logged_in

  def build(namespace, logged_in = true)
    @logged_in = logged_in.eql?(true)
    super(class: "site_title")
    add_class "navbar-brand" if @logged_in
    @namespace = namespace

    div class: "title" do
      site_title_link? ? site_title_with_link : site_title_content
    end
  end
end
