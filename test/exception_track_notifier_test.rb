require 'test_helper'

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
  end
end
