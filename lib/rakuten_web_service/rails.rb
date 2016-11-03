require 'rakuten_web_service'
require "rakuten_web_service/rails/version"
require 'rails'

module RakutenWebService
  class Railtie < ::Rails::Railtie
    initializer "rakuten_web_service.load_configuration" do
      config_path = ::Rails.root.join('config', 'rakuten_web_service.yml')

      self.load_configuration(config_path, ::Rails.env)
    end

    def load_configuration(config_path, environment)
      config = YAML.load(ERB.new(File.read(config_path)).result(binding))[environment]
      RakutenWebService.configure do |c|
        c.application_id = config['application_id']
        c.affiliate_id = config['affiliate_id']
      end
    end
  end
end
