Rails.application.routes.draw do
  mount ExceptionTrack::Engine => "/exception-track"
end
