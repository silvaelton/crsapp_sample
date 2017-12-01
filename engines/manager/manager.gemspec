$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "manager/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "manager"
  s.version     = Manager::VERSION
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

## a76db5383c982dcc863cf7945ec305e2.jpg
## #<ParticipationDocument id: 216, participation_id: 10, participation_type_id: 5, document: "a76db5383c982dcc863cf7945ec305e2.jpg", created_at: "2017-11-14 19:03:42", updated_at: "2017-11-14 19:03:42">


## #<ParticipationDocument id: 233, participation_id: 10, participation_type_id: 1, document: "3d278b0d170bd95c191d30ba1f521869.pdf", created_at: "2017-11-14 19:34:51", updated_at: "2017-11-14 19:34:51">
