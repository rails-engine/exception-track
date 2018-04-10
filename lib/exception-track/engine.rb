# frozen_string_literal: true

module ExceptionTrack
  class Engine < ::Rails::Engine
    isolate_namespace ExceptionTrack
  end
end
