class WidgetRatingsController < ApplicationController
  def create
    if params[:widget_id]
      # find the widget
      # update its rating
# XXX       redirect_to widget_path(params[:widget_id]),
# XXX         notice: "Thanks for rating!"
# START:edit:6
     # default render 
# END:edit:3
    else
      head :bad_request
    end
  end
end
