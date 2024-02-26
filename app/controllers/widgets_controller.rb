class WidgetsController < ApplicationController
  def show
    manufacturer = OpenStruct.new(
      id: rand(100),
      name: "Sector 7G",
      address: OpenStruct.new(
        id: rand(100),
        country: "UK"
      )
    )
    @widget = OpenStruct.new(id: params[:id],
# START:edit:3
                             manufacturer_id: manufacturer.id,
                             manufacturer: manufacturer,
# END:edit:3
                             name: "Widget #{params[:id]}")
  end
  def index
    @widgets = [
      OpenStruct.new(id: 1, name: "Stembolt"),
      OpenStruct.new(id: 2, name: "Flux Capacitor"),
    ]
  end
end
