# ActiveAdmin.register Input do
#   config.css_classes = {html: {container: {form: "container-fluid"}}}
#   config.components = {
#     html: {
#       main: {
#         html_options: {
#           form: {"data-bs-spy": "scroll", "data-bs-target": "#data-inputs-scrollspy", "data-bs-offset": 0, tabindex: 0}
#         }
#       }
#     }
#   }

#   permit_params Input.permitted_params

#   sidebar "", only: %i[new update], position: :left, body_class: "p-0", class: "overflow-hidden" do
#     div class: "list-group list-group-flush" do
#       a "Default", href: "#", class: "list-group-item"
#       a "Floating Labels", href: "#", class: "list-group-item"
#     end
#   end

#   form do |f|
#     columns do
#       column(span: 9) do
#         para "Inputs with the default Bootstrap form element styles."

#         div id: "list-item-stringish" do
#           h2 "Stringish"
#           f.inputs do
#             f.input :string
#             f.input :email
#             f.input :password
#             f.input :url
#             f.input :search
#             f.input :phone
#             f.input :color
#             f.input :datalist, as: :datalist, collection: %w[opt1 opt2 opt3]
#           end
#         end
#         hr

#         div id: "list-item-numeric" do
#           h2 "Numeric"
#           f.inputs do
#             f.input :number
#             f.input :range, as: :range, min: 0, max: 10, step: 1
#           end
#         end
#         hr

#         div id: "list-item-timeish" do
#           h2 "Timeish"
#           h3 "Select Inputs"
#           f.inputs do
#             f.input :date_select
#             f.input :datetime_select
#             f.input :time_select
#           end

#           h3 "Picker Inputs"
#           f.inputs do
#             f.input :date_picker, as: :date_picker, hint: 'Both "as: :date_picker" or "as: :datepicker" works'
#             f.input :datetime_picker, as: :datetime_picker
#             f.input :time_picker, as: :time_picker
#           end
#         end
#         hr

#         div id: "list-item-choices" do
#           h2 "Choices"
#           f.inputs do
#             f.input :select, collection: %w[opt1 opt2 opt3]
#             f.input :tom_select_single, as: :tom_select, collection: %w[opt1 opt2 opt3]
#             f.input :tom_select_multiple, as: :tom_select, collection: %w[opt1 opt2 opt3], multiple: true, error: true
#             f.input :check_boxes, as: :check_boxes, collection: %w[opt1 opt2 opt3]
#             f.input :radio, as: :radio, collection: %w[opt1 opt2 opt3]
#           end
#         end
#         hr

#         div id: "list-item-boolean" do
#           h2 "Boolean"
#           f.inputs do
#             f.input :boolean
#             f.input :switch, as: :switch
#           end
#         end
#         hr

#         div id: "list-item-textish" do
#           h2 "Textish"
#           f.inputs do
#             f.input :text
#             f.input :rich_text, as: :rich_text
#           end
#         end
#         hr

#         div id: "list-item-fileish" do
#           h2 "Fileish"
#           f.inputs do
#             f.input :file, as: :file
#           end
#         end
#       end

#       column(span: 3) do
#         nav id: "data-inputs-scrollspy", class: "nav flex-column nav-pills sticky-top" do
#           a "Stringish", href: "#list-item-stringish", class: "nav-link"
#           a "Numeric", href: "#list-item-numeric", class: "nav-link"
#           a "Timeish", href: "#list-item-timeish", class: "nav-link"
#           a "Choices", href: "#list-item-choices", class: "nav-link"
#           a "Boolean", href: "#list-item-boolean", class: "nav-link"
#           a "Textish", href: "#list-item-textish", class: "nav-link"
#           a "Fileish", href: "#list-item-fileish", class: "nav-link"
#         end
#       end
#     end

#     f.actions
#   end
# end
