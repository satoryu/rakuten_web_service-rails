require 'spec_helper'

describe RakutenWebService::Railtie do
  subject { RakutenWebService.configuration }

  it "has the configuration defined by YAML file under the app's config dir" do
    expect(subject.application_id).to eq 'rails_application_id'
    expect(subject.affiliate_id).to be_nil
  end
end
