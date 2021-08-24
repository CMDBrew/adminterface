module ActiveAdminBootstrap
  module Extensions
    module Views
      module Comments
        def default_title_class
          "title #{comments_css_classes.dig(:header, :title)}".squish
        end

        def default_wrapper_class
          "panel #{comments_css_classes[:wrapper]}".squish
        end

        def default_header_class
          "panel-header #{comments_css_classes.dig(:header, :wrapper)}".squish
        end

        def default_body_class
          "panel-body #{comments_css_classes[:body]}".squish
        end

        def item_class
          @item_class ||= comments_css_classes.dig(:item)
        end

        protected

        def build_comments
          build_comment_form

          div id: "active_admin_comments_wrap", class: "active_admin_comments" do
            if @comments.any?
              div class: "active_admin_comments_collection #{item_class[:group]}".squish do
                @comments.each(&method(:build_comment))
              end

              div class: "paginating-footer" do
                defaults = {theme: "active_admin", params: {anchor: "active_admin_comments_wrap"}}
                text_node paginate @comments, **defaults.merge(configs.comments_pager)
                div page_entries_info(@comments).html_safe, class: "pagination_information"
              end
            else
              build_empty_message
            end
          end
        end

        def build_comment(comment)
          div for: comment, class: "active_admin_comment #{item_class[:wrapper]}".squish do
            div class: "active_admin_comment_header #{item_class.dig(:header, :wrapper)}".squish do
              div class: "active_admin_comment_meta #{item_class.dig(:header, :meta)}".squish do
                div class: "active_admin_comment_author #{item_class.dig(:header, :author)}".squish do
                  comment.author ? auto_link(comment.author) : I18n.t("active_admin.comments.author_missing")
                end

                div pretty_format(comment.created_at), class: "timestamp"
              end

              comments_actions(comment)
            end

            div class: "active_admin_comment_body #{item_class[:body]}".squish do
              if comment.body.is_a?(ActionText::RichText)
                text_node comment.body
              else
                simple_format comment.body
              end
            end
          end
        end

        def comments_actions(comment)
          return unless authorized?(ActiveAdmin::Auth::DESTROY, comment)

          div class: "actions" do
            dropdown_menu "",
              button: {class: item_class[:actions]},
              menu: {class: "dropdown-menu-right"} do
              item(I18n.t("active_admin.comments.delete"), comments_url(comment.id),
                method: :delete, data: {confirm: I18n.t("active_admin.comments.delete_confirmation")})
            end
          end
        end

        def build_comment_form
          return unless authorized?(ActiveAdmin::Auth::CREATE, ActiveAdmin::Comment)

          input_type = comments_components[:input]
          css_classes = comments_css_classes

          active_admin_form_for(ActiveAdmin::Comment.new, url: comment_form_url) do |f|
            f.inputs do
              f.input :resource_type, as: :hidden, input_html: {value: ActiveAdmin::Comment.resource_type(parent.resource)}
              f.input :resource_id, as: :hidden, input_html: {value: parent.resource.id}
              f.input :body, as: input_type || "text", label: false, input_html: {rows: "3"}
            end
            f.actions do
              f.action :submit, label: I18n.t("active_admin.comments.add"), button_html: {class: css_classes["submit"]}
            end
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/orm/active_record/comments/views/active_admin_comments.rb
ActiveAdmin::Comments::Views::Comments.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::Comments
  has_css_classes_for :comments
  has_components_for :comments

  def build(resource)
    if authorized?(ActiveAdmin::Auth::READ, ActiveAdmin::Comment)
      @resource = resource
      @comments =
        active_admin_authorization
          .scope_collection(ActiveAdmin::Comment.find_for_resource_in_namespace(resource, active_admin_namespace.name)
          .includes(:author).public_send(Kaminari.config.page_method_name, params[:page])).per(configs.comments_per_page)
      super(title, for: resource)
      build_comments
    end
  end
end
