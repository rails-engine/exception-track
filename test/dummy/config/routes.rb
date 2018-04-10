# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "welcome#index"

  mount ExceptionTrack::Engine => "/exception-track"

  get "/:id", to: "welcome#index"
end
