class RakutenWebService::ConfigGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)

  def copy_config_file
    copy_file "rakuten_web_service.yml", "config/rakuten_web_service.yml"
  end
end
