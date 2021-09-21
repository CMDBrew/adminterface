module Adminterface
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
