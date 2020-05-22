# frozen_string_literal: true

module ExceptionTrack
  class Engine < ::Rails::Engine
    isolate_namespace ExceptionTrack

    initializer "exception-track.assets.precompile", group: :all do |app|
      app.config.assets.precompile += %w[exception-track/application.css]
    end
  end
end
