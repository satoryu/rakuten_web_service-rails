$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rakuten_web_service/rails'

RSpec.configure do |config|
  config.around(:all) do |example|
     if env = example.metadata[:env]
       env.each do |k, v|
         ENV[k.to_s.upcase] = v.to_s
       end

       example.run

       env.keys { |k| ENV.delete k }
     else
       example.run
     end
  end

  config.after do
    RakutenWebService.instance_variable_set(:@configuration, nil)
  end
end
