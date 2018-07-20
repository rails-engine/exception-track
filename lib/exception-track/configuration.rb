# frozen_string_literal: true

module ExceptionTrack
  class Configuration
    # environments for store Exception log in to database.
    # default: [:development, :production]
    attr_accessor :environments

    # Basic authentication (used in none session application).
    # While basic auth enabled and both name & password exist, basic authentication will used.
    # Default all are nil.
    attr_accessor :basic_auth_enable
    attr_accessor :basic_auth_name
    attr_accessor :basic_auth_password

    def enabled_env?(env)
      return false if env.blank?
      environments.include?(env.to_sym)
    end
  end
end
