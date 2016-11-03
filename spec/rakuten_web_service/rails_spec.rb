require 'spec_helper'

describe RakutenWebService::Railtie do
  describe ".load_configuration" do
    before do
      config_path = File.expand_path('../../fixtures/rakuten_web_service.yml', __FILE__)
      RakutenWebService::Railtie.instance.load_configuration(config_path, 'test')
    end

    subject { RakutenWebService.configuration }

    it "has the configurations for TEST env" do
      expect(subject.application_id).to eq 'test_application_id'
      expect(subject.affiliate_id).to eq 'test_affiliate_id'
    end
  end
end
