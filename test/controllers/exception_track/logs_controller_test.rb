# frozen_string_literal: true

require "test_helper"

module ExceptionTrack
  class LogsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @log = exception_track_logs(:one)
      @base_headers = {
        'HTTP_AUTHORIZATION': ActionController::HttpAuthentication::Basic.encode_credentials("admin", "password")
      }
    end

    test "should get index" do
      get logs_url, headers: @base_headers
      assert_response :success
    end

    test "should get /exception-track" do
      get "/exception-track", headers: @base_headers
      assert_response :success
    end

    test "should show exception_log" do
      get log_url(@log), headers: @base_headers
      assert_response :success

      get "/exception-track/#{@log.id}", headers: @base_headers
      assert_response :success
    end

    test "should destroy_all exception_log" do
      exception_track_logs(:one)
      exception_track_logs(:one)
      assert_equal(2, Log.count)
      delete "/exception-track/all", headers: @base_headers
      assert_equal(0, Log.count)

      assert_redirected_to logs_url
    end

    test "shouldn't get /exception-track without basic auth" do
      get logs_url
      assert_response :unauthorized
    end
  end
end
