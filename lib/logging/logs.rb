module Logging
  module Logs
    def log(message_or_object,message=nil)
      request_id = Current.request_id
# START:edit:3
      message = if message.nil?
        message_or_object
      else
        object = message_or_object
        if object.respond_to?(:id)
          "(#{object.class}/#{object.id} #{message}"
        else
          "(#{object.class}/#{object} #{message}"
        end
      end
      Rails.logger.info("[#{self.class}] " \
                        "request_id:#{request_id} " \
                        "#{message}")
# END:edit:3
    end
  end
end
