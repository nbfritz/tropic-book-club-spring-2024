class WidgetsController < ApplicationController
  def new
    @widget = Widget.new
# XXX     @widget.errors.add(:name,           :blank)
# XXX     @widget.errors.add(:manufacturer_id,:blank)
# XXX     @widget.errors.add(:price_cents,    :not_a_number)
# START:edit:7

# END:edit:3
    @manufacturers = Manufacturer.all
  end

  def create
    @widget = Widget.create(
      name: params.require(:widget)[:name],
      price_cents: params.require(:widget)[:price_cents],
      manufacturer_id: params.require(:widget)[:manufacturer_id],
      widget_status: WidgetStatus.first)
    if @widget.valid?
      redirect_to widget_path(@widget)
    else
      @manufacturers = Manufacturer.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @widget = Widget.find(params[:id])
  end
  def index
    @widgets = [
      OpenStruct.new(id: 1234, name: "Stembolt"),
      OpenStruct.new(id: 2, name: "Flux Capacitor"),
    ]
  end
end
