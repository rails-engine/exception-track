module Exception
  module Track
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
