require "test_helper"

module ColumnsTest
  class DefaultTest < ActiveAdminTest
    setup do
      @component = render_arbre_component do
        columns do
          column do
            span "Column #1"
          end

          column do
            span "Column #2"
          end
        end
      end
    end

    test "#class_list" do
      assert @component.class_list.include?("row")
    end

    test "#component" do
      html =
        <<~HTML
          <div class="row">
            <div class="col-md">
              <span>Column #1</span>
            </div>
            <div class="col-md">
              <span>Column #2</span>
            </div>
          </div>
        HTML
      assert_html html, @component
    end
  end

  class WithColumnOptionsTest < ActiveAdminTest
    setup do
      @component = render_arbre_component do
        columns do
          column(class: "custom-column", size: "md", span: 8) do
            span "Column #1"
          end
        end
      end
    end

    test "#component" do
      html =
        <<~HTML
          <div class="row">
            <div class="col-md-8 custom-column">
              <span>Column #1</span>
            </div>
          </div>
        HTML
      assert_html html, @component
    end
  end
end
