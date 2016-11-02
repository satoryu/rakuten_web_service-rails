require 'spec_helper'

describe RakutenWebService::Railtie do
  describe RakutenWebService::Configuration do
    subject { RakutenWebService.configuration }

    it "has the configurations for TEST env" do
      expect(subject.application_id).to eq 'test_application_id'
      expect(subject.affiliate_id).to eq 'test_affiliate_id'
    end
  end
end
