module ExceptionTrack
  class Log < ActiveRecord::Base
    self.table_name = 'exception_tracks'
    before_save :check_title

    def check_title
      max_title_len = 255
      self.title = self.title[0, max_title-2] if self.title.size > max_title_len
    end

  end
end
