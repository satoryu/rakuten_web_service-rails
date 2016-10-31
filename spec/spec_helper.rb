$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
ENV['RAILS_ENV'] = 'test'
require File.expand_path('../dummy_app/config/environment', __FILE__)
require 'rakuten_web_service/rails'
