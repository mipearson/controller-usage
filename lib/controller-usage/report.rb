module ControllerUsage
  class Report
    include ControllerUsage::Config
    
    def available_actions
      @available_actions ||= begin
        controllers = Dir[Rails.root.join('app', 'controllers', '*_controller.rb')].map { |filename|
          File.basename(filename).gsub(/.rb$/, '').camelcase
        }.uniq.sort

        controllers.map { |controller|  
          controller.constantize.action_methods.reject { |method|
            method =~ /^_/
          }.map do |method|
            "#{controller}##{method}"
          end
        }.flatten.sort
      end
    end

    def used_actions
      @used_actions ||= File.read(log_file).split("\n").map { |line|
        line.split(' ')[1]
      }.reject(&:blank?).sort.uniq
    end
  end
end