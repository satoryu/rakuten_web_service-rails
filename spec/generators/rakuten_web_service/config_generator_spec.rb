require 'spec_helper'

require 'generators/rakuten_web_service/config_generator'

describe RakutenWebService::ConfigGenerator, type: :generator do
  destination File.expand_path("./../../../tmp", __FILE__)

  before do
    prepare_destination

    run_generator
  end

  describe "generated configuration file" do
    subject { file('config/rakuten_web_service.yml') }

    it { is_expected.to exist }
  end
end
