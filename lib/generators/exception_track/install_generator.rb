require 'rails/generators'
module ExceptionTrack
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Create ExceptionTrack's base files"
      source_root File.expand_path('../../../../', __FILE__)

      def add_initializer
        template 'config/initializers/exception-track.rb', 'config/initializers/exception-track.rb'
      end

      def add_migrations
        exec('rake exception_track:install:migrations')
      end
    end
  end
end
