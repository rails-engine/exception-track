# frozen_string_literal: true

require "test_helper"

class ExceptionTrack::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, ExceptionTrack
  end

  test "config" do
    assert_kind_of ExceptionTrack::Configuration, ExceptionTrack.config
    assert_equal %i[test production], ExceptionTrack.config.environments
  end

  test "config.enabled_env?" do
    config = ExceptionTrack.config
    assert_equal true, config.enabled_env?("test")
    assert_equal true, config.enabled_env?(:test)
    assert_equal false, config.enabled_env?(:development)
    assert_equal true, config.enabled_env?(:production)
  end

  test "ExceptionNotification config" do
    assert_equal true, ExceptionNotifier.notifiers.include?(:exception_track)
  end
end
