module ControllerUsage
  module Config
    def log_file
      Rails.root.join('log', 'controller-usage.log')
    end
  end
end
