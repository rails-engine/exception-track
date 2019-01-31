# frozen_string_literal: true

ExceptionTrack::Engine.routes.draw do
  resources :logs, path: "" do
    collection do
      delete :all
      post :export
    end
  end
end
