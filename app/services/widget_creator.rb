class WidgetCreator
  def create_widget(widget)
    widget.widget_status =
      WidgetStatus.find_by!(name: "Fresh")
    widget.save
    if widget.invalid?
      return Result.new(created: false, widget: widget)
    end
# XXX
# XXX
    HighPricedWidgetCheckJob.perform_async(
        widget.id, widget.price_cents)
    WidgetFromNewManufacturerCheckJob.perform_async(
        widget.id, widget.manufacturer.created_at.to_s)
    Result.new(created: widget.valid?, widget: widget)
  end

# XXX   def post_widget_creation_job(widget)
# XXX     if widget.price_cents > 7_500_00
# XXX       FinanceMailer.high_priced_widget(widget).deliver_now
# XXX     end
# XXX
# XXX     if widget.manufacturer.created_at.after?(60.days.ago)
# XXX       AdminMailer.new_widget_from_new_manufacturer(widget).
# XXX         deliver_now
# XXX     end
# XXX   end
# XXX
# XXX   class Result
# START:edit:16
  def high_priced_widget_check(widget_id, original_price_cents)
    if original_price_cents > 7_500_00
      widget = Widget.find(widget_id)
      FinanceMailer.high_priced_widget(widget).deliver_now
    end 
  end

  def widget_from_new_manufacturer_check(
      widget_id, original_manufacturer_created_at)
    if original_manufacturer_created_at.after?(60.days.ago)
      widget = Widget.find(widget_id)
      AdminMailer.new_widget_from_new_manufacturer(widget).
        deliver_now
    end
  end
  class Result
# END:edit:3
    attr_reader :widget
    def initialize(created:, widget:)
      @created = created
      @widget = widget
    end

    def created?
      @created
    end
  end
end
