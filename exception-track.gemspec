# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "exception-track/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "exception-track"
  s.version = ExceptionTrack::VERSION
  s.authors = ["Jason Lee"]
  s.email = ["huacnlee@gmail.com"]
  s.homepage = "https://github.com/rails-engine/exception-track"
  s.summary = "Tracking exceptions for Rails application store them in database."
  s.description = "Tracking exceptions for Rails application store them in database by exception_notification gem."
  s.license = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "README.md"]

  s.add_dependency "kaminari", ">= 0.15"
  s.add_dependency "rails", ">= 5.2"
  s.add_development_dependency "pg", ">= 1"
  s.add_development_dependency "mocha", ">= 0.13.0"
  s.add_development_dependency "mock_redis", "~> 0.19.0"
  s.add_development_dependency "resque", "~> 1.8.0"
  s.add_development_dependency "sidekiq", ">= 5.0.4"
  s.add_development_dependency "timecop", "~> 0.9.0"
end
