$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "site/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "site"
  s.version     = Site::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "https://github.com/silvaelton/crcsapp_sample.git"
  s.summary     = "Summary of Manager."
  s.description = "Description of Manager."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.4"

  s.add_development_dependency "sqlite3"
end
