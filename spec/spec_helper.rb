if ENV['CI']
  require 'simplecov'

  SimpleCov.start do
    add_filter '/spec/'
  end
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

ENV['RAILS_ENV'] = 'test'
require File.expand_path('./../dummy_app/config/environment', __FILE__)
require 'ammeter/init'
require 'rakuten_web_service/rails'

RSpec.configure do |config|
  config.filter_run_excluding :integration

  config.around(:all) do |example|
    env = example.metadata[:env]
    if env
      env.each do |k, v|
        ENV[k.to_s.upcase] = v.to_s
      end

      example.run

      env.keys { |k| ENV.delete k }
    else
      example.run
    end
  end

  config.after do
    RakutenWebService.instance_variable_set(:@configuration, nil)
  end
end
