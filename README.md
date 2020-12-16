## ExceptionTrack

Tracking exceptions for Rails application store them in database.

This gem is base on [exception_notification](https://github.com/smartinez87/exception_notification/).

[中文介绍和使用说明](https://ruby-china.org/topics/32325)

[![Gem Version](https://badge.fury.io/rb/exception-track.svg)](https://badge.fury.io/rb/exception-track) [![build](https://github.com/rails-engine/exception-track/workflows/build/badge.svg)](https://github.com/rails-engine/exception-track/actions?query=workflow%3Abuild) [![codecov.io](https://codecov.io/github/rails-engine/exception-track/coverage.svg?branch=master)](https://codecov.io/github/rails-engine/exception-track?branch=master)

![2017-02-17 12 35 18](https://cloud.githubusercontent.com/assets/5518/23052599/8e267c02-f50d-11e6-8d6e-cef0cc1991b7.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'exception-track'
```

And then execute:

```bash
$ bundle
```

Generate migration and config files

```bash
$ rails g exception_track:install
```

And mount routers:

config/router.rb

```rb
Rails.application.routes.draw do
  mount ExceptionTrack::Engine => "/exception-track"
end
```

Now you can open: http://localhost:3000/exception-track

## Configuration

Add config/initializers/exception-track.rb

```rb
ExceptionTrack.configure do
  # environments for store Exception log in to database.
  # default: [:development, :production]
  # self.environments = %i(production)
end
```

## exception_notification Configuration

You can config [exception_notification](https://github.com/smartinez87/exception_notification/) by itself's way, more documentations please visit:

https://github.com/smartinez87/exception_notification/

## Router admin authenticate

```rb
# lib/admin_constraint.rb
class AdminConstraint
  def matches?(request)
    return false if !request.session[:user_id]
    user = User.find(request.session[:user_id])
    user && user.admin?
  end
end

# config/router.rb
require 'admin_constraint'
mount ExceptionTrack::Engine => "/exception-track", constraints: AdminConstraint.new
```

**With Devise**

```rb
# config/routes.rb
authenticate :user, ->(u) { u.admin? } do
  mount ExceptionTrack::Engine => "/exception-track"
end
```

More examples: [Sidekiq Web Document](https://github.com/mperham/sidekiq/wiki/Monitoring#authentication)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
