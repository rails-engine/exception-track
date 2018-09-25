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

      parameters = env["action_dispatch.request.parameters"] || {}

      headers = []
      headers << "Method:      #{env['REQUEST_METHOD']}"
      headers << "URL:         #{env['REQUEST_URI']}"
      headers << "Controller:  #{parameters['controller']}##{parameters['action']}"
      headers << "RequestId:   #{env['action_dispatch.request_id']}"
      headers << "User-Agent:  #{env['HTTP_USER_AGENT']}"
      headers << "Remote IP:   #{env['REMOTE_ADDR']}"
      headers << "Language:    #{env['HTTP_ACCEPT_LANGUAGE']}"
      headers << "Server:      #{Socket.gethostname}"
      headers << "Process:     #{$PROCESS_ID}"

      headers.join("\n")
    end
  end
end
