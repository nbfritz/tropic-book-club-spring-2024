class ApiController < ApplicationController
# START:edit:3
  before_action :authenticate

private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.find_by(key: token, deactivated_at: nil).present?
    end
  end
# END:edit:3
end
