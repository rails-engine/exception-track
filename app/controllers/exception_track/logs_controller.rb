# frozen_string_literal: true

module ExceptionTrack
  class LogsController < ActionController::Base
    layout "exception-track/application"
    before_action :set_log, only: :show

    # GET /exception_logs
    def index
      @logs = Log.order("id desc").page(params[:page]).per(15)
    end

    def export
      @logs = Log.order("id desc").where("created_at >= ?", 3.months.ago)
      send_data JSON.pretty_generate(@logs.as_json(only: %i[title body created_at updated_at])), filename: "#{Date.current}.json", disposition: "attachment"
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
  end
end
