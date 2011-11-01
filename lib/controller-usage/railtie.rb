module ControllerUsage
  class Railtie < Rails::Railtie
    
    initializer "controller-usage.initialize" do |app|
      ActiveSupport.on_load :action_controller do
        Subscriber.attach
      end
    end
    
    rake_tasks do
      load File.expand_path('../tasks.rb', __FILE__)
    end
  end
end
      