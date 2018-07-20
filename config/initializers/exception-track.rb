# frozen_string_literal: true

# require 'exception_notification/sidekiq'

ExceptionTrack.configure do
  # environments for store Exception log in to database.
  # default: [:development, :production]
  # self.environments = %i(development production)
  #
  # Basic authentication (used in none session application).
  # While basic auth enabled and both name & password exist, basic authentication will used.
  # Default all are nil.
  # self.basic_auth_enable = Rails.env.production?
  # self.basic_auth_name = "admin"
  # self.basic_auth_password = ENV['BASIC_AUTH_PASSWORD']
end

# ExceptionNotification.configure do |config|
#   config.ignored_exceptions += %w(ActionView::TemplateError
#                                   ActionController::InvalidAuthenticityToken
#                                   ActionController::BadRequest
#                                   ActionView::MissingTemplate
#                                   ActionController::UrlGenerationError
#                                   ActionController::UnknownFormat)
# end
