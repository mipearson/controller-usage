module ControllerUsage
  class Subscriber < ActiveSupport::LogSubscriber
    include ControllerUsage::Config
    
    def self.attach
      attach_to :action_controller
    end
    
    def logger
      @logger ||= ActiveSupport::BufferedLogger.new(log_file)
    end
  
    def start_processing event
      begin
        payload = event.payload
        logger.info "#{Time.now.tv_sec} #{payload[:controller]}##{payload[:action]}"
      rescue => e
        Rails.logger.warn "ControllerUsage Error: " + e.inspect
      end
    end
  end
end