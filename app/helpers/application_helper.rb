module ApplicationHelper

  def styled_widget_id(widget)
    content_tag(:span,
# START:edit:3
                widget.widget_id.to_s.rjust(7,"0"),
# END:edit:3
                style: "font-family: monospace")
  end
end
