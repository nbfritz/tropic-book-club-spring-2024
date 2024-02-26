require "test_helper"

class WidgetRatingComponentTest < ViewComponent::TestCase
  def test_show_cta
    render_inline(
      WidgetRatingComponent.new(
        widget: OpenStruct.new(id: 1234),
        show_cta: true
      )
    )
    assert_text("Your ratings help us be amazing")
  end
  def test_no_cta
    render_inline(
      WidgetRatingComponent.new(
        widget: OpenStruct.new(id: 1234),
        show_cta: false
      )
    )
    refute_text("Your ratings help us be amazing")
  end
end
