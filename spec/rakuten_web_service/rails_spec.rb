require 'spec_helper'

describe RakutenWebService::Railtie do
  describe ".load_configuration" do
    let(:config_path) do
      File.expand_path('../../fixtures/rakuten_web_service.yml', __FILE__)
    end

    before do
      RakutenWebService::Railtie.instance.load_configuration(config_path, 'test')
    end

    subject { RakutenWebService.configuration }

    it "has the configurations" do
      expect(subject.application_id).to eq 'test_application_id'
      expect(subject.affiliate_id).to eq 'test_affiliate_id'
    end

    describe "ERB-based configuration file", env: { rws_affiliate_id: 'env_affiliate_id' } do
      let(:config_path) do
        File.expand_path('../../fixtures/rakuten_web_service.erb.yml', __FILE__)
      end

      it "has the configurations for TEST env" do
        expect(subject.application_id).to eq 'test_application_id'
        expect(subject.affiliate_id).to eq 'env_affiliate_id'
      end
    end
  end
end
