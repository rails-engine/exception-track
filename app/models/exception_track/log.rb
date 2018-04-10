# frozen_string_literal: true

module ExceptionTrack
  class Log < ActiveRecord::Base
    self.table_name = "exception_tracks"
  end
end
