class ApplicationController < ActionController::Base
# START:edit:3
  before_action :set_current_request_id

  def set_current_request_id
    Current.request_id = request.request_id
  end

# END:edit:3
  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.request_id
  end
end
