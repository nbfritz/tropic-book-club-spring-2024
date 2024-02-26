# frozen_string_literal: true

class WidgetRatingComponent < ViewComponent::Base
# START:edit:3
  attr_reader :widget, :show_cta
  def initialize(widget:, show_cta: true)
# END:edit:3
    @widget = widget
    @show_cta = show_cta
  end

end
