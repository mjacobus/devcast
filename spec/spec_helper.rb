# Require this file for unit tests
ENV['LOTUS_ENV'] ||= 'test'

if ENV['COVERALLS']
  require 'coveralls'
  Coveralls.wear!
end

if ENV['COVERAGE']
  require 'simplecov'

  SimpleCov.start do
    add_filter "/spec/"
    add_group "Devcast", "lib/devcast"
    add_group "Apps", "apps"
    add_group "Web", "apps/web"
    add_group "Controllers", "apps/web/controllers"
    add_group "Views", "apps/web/views"
  end
end

require_relative '../config/environment'
require 'minitest/autorun'

Lotus::Application.preload!
