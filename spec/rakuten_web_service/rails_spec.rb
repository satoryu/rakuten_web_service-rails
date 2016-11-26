require 'spec_helper'

describe RakutenWebService::Railtie do
  describe ".load_configuration" do
    let(:config_path) do
      File.expand_path('../../fixtures/rakuten_web_service.yml', __FILE__)
    end

    subject { RakutenWebService.configuration }

    context "YAML file is defined" do
      it "has the configurations" do
        RakutenWebService::Railtie.instance.load_configuration(config_path, 'test')

        expect(subject.application_id).to eq 'test_application_id'
        expect(subject.affiliate_id).to eq 'test_affiliate_id'
      end
    end

    context "ERB-based configuration file", env: { rws_affiliate_id: 'env_affiliate_id' } do
      let(:config_path) do
        File.expand_path('../../fixtures/rakuten_web_service.erb.yml', __FILE__)
      end

      it "has the configurations for TEST env" do
        RakutenWebService::Railtie.instance.load_configuration(config_path, 'test')

        expect(subject.application_id).to eq 'test_application_id'
        expect(subject.affiliate_id).to eq 'env_affiliate_id'
      end
    end

    context "test environment is not defined in the config file" do
      let(:config_path) do
        File.expand_path('../../fixtures/rakuten_web_service_empty.yml', __FILE__)
      end

      it "raises runtime error" do
        expect {
          RakutenWebService::Railtie.instance.load_configuration(config_path, 'test')
        }.to raise_error(RuntimeError, "Required configuration for RakutenWebService has not been set")
      end

      context "but defined by environment variable", env: { rws_application_id: 'env_application_id' } do
        it "doen's raise runtime error" do
          expect {
            RakutenWebService::Railtie.instance.load_configuration(config_path, 'test')
          }.to_not raise_error
        end
      end
    end
  end
end
