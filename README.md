ExceptionTrack
--------------

Tracking exceptions for Rails application store them in database.

This gem is base on [exception_notification](https://github.com/smartinez87/exception_notification/).

[![Gem Version](https://badge.fury.io/rb/exception-track.svg)](https://badge.fury.io/rb/exception-track) [![Build Status](https://travis-ci.org/rails-engine/exception-track.svg)](https://travis-ci.org/rails-engine/exception-track) [![Code Climate](https://codeclimate.com/github/rails-engine/exception-track/badges/gpa.svg)](https://codeclimate.com/github/rails-engine/exception-track) [![codecov.io](https://codecov.io/github/rails-engine/exception-track/coverage.svg?branch=master)](https://codecov.io/github/rails-engine/exception-track?branch=master) [![](http://inch-ci.org/github/rails-engine/exception-track.svg?branch=master)](http://inch-ci.org/github/rails-engine/exception-track?branch=master)

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

## Configuration

Add config/initializers/exception-track.rb

```rb
ExceptionTrack.configure do
  # environments for store Exception log in to database.
  # default: [:development, :production]
  # self.environments = %i(production)
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
