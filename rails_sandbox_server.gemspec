$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_sandbox_server/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_sandbox_server"
  s.version     = RailsSandboxServer::VERSION
  s.authors     = ["amacou"]
  s.email       = ["amacou.abf@gmail.com"]
  s.homepage    = "http://blog.amacou.net"
  s.summary     = "RailsSandboxServer."
  s.description = "RailsSandboxServer."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry"
end
