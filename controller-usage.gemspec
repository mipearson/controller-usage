$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "controller-usage/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "controller-usage"
  s.version     = ControllerUsage::VERSION
  s.authors     = ["Michael Pearson"]
  s.email       = ["mipearson@gmail.com"]
  s.homepage    = "http://github.com/mipearson/controller-usage"
  s.summary     = "Track usage of controllers and actions."
  s.description = "Track usage of controllers and actions."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.0.1"

end
