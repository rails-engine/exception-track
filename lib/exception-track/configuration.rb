module ExceptionTrack
  class Configuration
    # environments for store Exception log in to database.
    # default: [:development, :production]
    attr_accessor :environments

    def enabled_env?(env)
      return false if env.blank?
      environments.include?(env.to_sym)
    end
  end
end
