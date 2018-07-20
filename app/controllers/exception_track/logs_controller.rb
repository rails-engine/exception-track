# frozen_string_literal: true

module ExceptionTrack
  class LogsController < ActionController::Base
    layout "exception-track/application"
    before_action :authenticate
    before_action :set_log, only: %i[show destroy]

    # GET /exception_logs
    def index
      @logs = Log.order("id desc").page(params[:page]).per(15)
    end

    # GET /exception_logs/1
    def show; end

    # DELETE /exception_logs/all
    def all
      Log.delete_all
      redirect_to logs_url, notice: "Logs was successfully destroyed."
    end

    private

      # Use callbacks to share common setup or constraints between actions.
      def set_log
        @log = Log.find(params[:id])
      end

      def authenticate
        if ExceptionTrack.config.basic_auth_enable &&
           ExceptionTrack.config.basic_auth_name.present? &&
           ExceptionTrack.config.basic_auth_password.present?

          self.class.http_basic_authenticate_with name: ExceptionTrack.config.basic_auth_name,
                                                  password: ExceptionTrack.config.basic_auth_password
        end
      end
  end
end
