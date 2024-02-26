module ApplicationHelper
# START:edit:3

  def styled_widget_id(widget)
    content_tag(:span,
                widget.widget_id,
                style: "font-family: monospace")
  end
# END:edit:3
end
