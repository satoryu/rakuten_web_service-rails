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
      return unless File.exists? config_path

      config = YAML.load(ERB.new(File.read(config_path)).result(binding))[environment]
      if config
        RakutenWebService.configure do |c|
          c.application_id = config['application_id']
          c.affiliate_id = config['affiliate_id']
        end
      end
      raise RuntimeError, "Required configuration for RakutenWebService has not been set" unless RakutenWebService.configuration.has_required_options?
    end
  end
end
