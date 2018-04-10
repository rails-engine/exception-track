# frozen_string_literal: true

require "test_helper"

module ExceptionTrack
  class LogsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @log = exception_track_logs(:one)
    end

    test "should get index" do
      get logs_url
      assert_response :success
    end

    test "should get /exception-track" do
      get "/exception-track"
      assert_response :success
    end

    test "should show exception_log" do
      get log_url(@log)
      assert_response :success

      get "/exception-track/#{@log.id}"
      assert_response :success
    end

    test "should destroy_all exception_log" do
      exception_track_logs(:one)
      exception_track_logs(:one)
      assert_equal(2, Log.count)
      delete "/exception-track/all"
      assert_equal(0, Log.count)

      assert_redirected_to logs_url
    end
  end
end
