require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "styled_widget_id less than 6 digits, prefixes with 0's" do
    widget = OpenStruct.new(widget_id: "12.34")
    rendered_markup = styled_widget_id(widget)

    assert_match /\D0012\.34\D/,rendered_markup
    assert rendered_markup.html_safe?
  end

  test "styled_widget_id 6 digits or more has no prefix" do
    widget = OpenStruct.new(widget_id: "9876.54")
    rendered_markup = styled_widget_id(widget)

    assert_match /\D9876\.54\D/,rendered_markup
    assert rendered_markup.html_safe?
  end
end
