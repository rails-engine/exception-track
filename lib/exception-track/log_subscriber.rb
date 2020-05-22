# frozen_string_literal: true

module ExceptionTrack
  class LogSubscriber < ActiveSupport::LogSubscriber
    # ActiveSupport::Notifications.instrument('track.exception_track', action: action)
    def track(event)
      prefix = color("ExceptionTrack", CYAN)
      title = color(event.payload[:title], RED)
      debug "  #{prefix} track db (#{event.duration.round(1)}ms)"
    end
  end
end
