namespace :cu do
  
  desc "controllers/actions combinations in this application"
  task :available do
    present report.available_actions
  end
  
  desc "controllers/actions found in the log file"
  task :used do
    present report.used_actions
  end
  
  desc "controllers/actions in your application that have not been used"
  task :unused do
    present report.available_actions.reject { |action| 
      report.used_actions.include? action
    }
  end 
  
  desc "controllers/actions found in the log file but not found in your application"
  task :missing do
    present report.used_actions.reject { |action|
      report.available_actions.include? action
    }
  end
  
  def report
    @report ||= ControllerUsage::Report.new
  end
  
  def present collection
    puts collection.join("\n")
  end
end