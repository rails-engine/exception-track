require 'exception-track/version'
require 'exception-track/configuration'
require 'exception-track/engine'

require 'exception_notification'
require 'exception_notification/rails'
require 'exception_notifier/exception_track_notifier'

require 'kaminari'

module ExceptionTrack
  class << self
    def config
      return @config if defined?(@config)
      @config = Configuration.new
      @config.environments = %i(development production)
      @config
    end

    def configure(&block)
      config.instance_exec(&block)
    end
  end
end

ExceptionNotification.configure do |config|
  config.add_notifier :exception_track, {}
end
