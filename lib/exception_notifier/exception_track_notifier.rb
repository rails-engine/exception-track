# frozen_string_literal: true

module ExceptionNotifier
  class ExceptionTrackNotifier < ExceptionNotifier::BaseNotifier
    def initialize(_options); end

    def call(exception, _options = {})
      return unless ExceptionTrack.config.enabled_env?(Rails.env)

      # send the notification
      title = exception.message || "None"

      messages = []
      messages << headers_for_env(_options[:env])
      messages << ""
      messages << "--------------------------------------------------"
      messages << ""
      messages << exception.inspect
      unless exception.backtrace.blank?
        messages << "\n"
        messages << exception.backtrace
      end

      ExceptionTrack::Log.create(title: title[0, 200], body: messages.join("\n"))
    rescue => e
      errs = []
      errs << "-- [ExceptionTrack] create error ---------------------------"
      errs << e.message.indent(2)
      errs << ""
      errs << "-- Exception detail ----------------------------------------"
      errs << title.indent(2)
      errs << ""
      errs << messages.join("\n").indent(2)
      Rails.logger.error errs.join("\n")
    end

    # Log Request headers from Rack env
    def headers_for_env(env)
      return "" if env.blank?

      parameters = filter_parameters(env)

      headers = []
      headers << "Method:      #{env['REQUEST_METHOD']}"
      headers << "URL:         #{env['REQUEST_URI']}"
      if env['REQUEST_METHOD'].downcase != "get"
        headers << "Parameters:\n#{pretty_hash(parameters.except(:controller, :action), 13)}"
      end
      headers << "Controller:  #{parameters['controller']}##{parameters['action']}"
      headers << "RequestId:   #{env['action_dispatch.request_id']}"
      headers << "User-Agent:  #{env['HTTP_USER_AGENT']}"
      headers << "Remote IP:   #{env['REMOTE_ADDR']}"
      headers << "Language:    #{env['HTTP_ACCEPT_LANGUAGE']}"
      headers << "Server:      #{Socket.gethostname}"
      headers << "Process:     #{$PROCESS_ID}"

      headers.join("\n")
    end

    def filter_parameters(env)
      parameters = env["action_dispatch.request.parameters"] || {}
      parameter_filter = ActionDispatch::Http::ParameterFilter.new(env["action_dispatch.parameter_filter"] || [])
      return parameter_filter.filter(parameters)
    rescue => e
      Rails.logger.error "filter_parameters error: #{e.inspect}"
      return parameters
    end

    def pretty_hash(params, indent = 0)
      json = JSON.pretty_generate(params)
      json.indent(indent)
    end
  end
end
