# frozen_string_literal: true

require "test_helper"

module ExceptionNotifier
  class ExceptionTrackNotifier::Test < ActiveSupport::TestCase
    setup do
      @notifier = ExceptionTrackNotifier.new({})
    end

    test ".call" do
      e = Exception.new("Hello world")
      assert_difference "ExceptionTrack::Log.count", +1 do
        @notifier.call(e)
      end
      log = ExceptionTrack::Log.last
      assert_equal e.message, log.title
    end

    test "filter_parameters" do
      filters = [:password, "token"]
      raw_parameters = {
        password: "123456",
        "name" => "foo",
        user: {
          token: "aaabbbccc"
        }
      }
      env = {
        "action_dispatch.parameter_filter" => filters,
        "action_dispatch.request.parameters" => raw_parameters,
      }
      params = @notifier.filter_parameters(env)
      assert_equal({ password: "[FILTERED]", "name" => "foo", user: { token: "[FILTERED]" } }, params)

      # when filter is nil
      env = { "action_dispatch.request.parameters" => raw_parameters }
      params = @notifier.filter_parameters(env)
      assert_equal(raw_parameters, params)

      # when params is nil
      params = @notifier.filter_parameters({})
      assert_equal({}, params)
    end

    test "pretty_hash" do
      params = {
        password: "123456",
        "name" => "foo",
        user: {
          token: "aaabbbccc"
        }
      }

      expected = <<-HASH
       {
         "password": "123456",
         "name": "foo",
         "user": {
           "token": "aaabbbccc"
         }
       }
      HASH
      assert_equal expected.strip, @notifier.pretty_hash(params, 7).strip
    end
  end
end
