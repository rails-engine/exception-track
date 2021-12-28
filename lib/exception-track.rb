# frozen_string_literal: true

require "exception-track/version"
require "exception-track/configuration"
require "exception-track/log_subscriber"
require "exception-track/engine"

require "exception_notification"
require "exception_notification/rails"

require "kaminari"

module ExceptionTrack
  class << self
    def config
      return @config if defined?(@config)

      @config = Configuration.new
      @config.environments = %i[development production]
      @config
    end

    def configure(&block)
      config.instance_eval(&block)
    end
  end
end

ExceptionNotification.configure do |config|
  config.add_notifier :db, {}
end
