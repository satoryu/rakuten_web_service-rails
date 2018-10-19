
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rakuten_web_service/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'rakuten_web_service-rails'
  spec.version       = RakutenWebService::Rails::VERSION
  spec.authors       = ['Tatsuya Sato']
  spec.email         = ['satoryu.1981@gmail.com']

  spec.summary       = 'rakuten_web_service\' with your Rails app.'
  spec.description   = 'This gem provides an initializer to load configurations of \'rakuten_web_service\' with your Rails applications.'
  spec.homepage      = 'https://github.com/satoryu/rakuten_web_service-rails'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.2.0'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_dependency 'rails', '> 4.2', '< 5.3.0'
  spec.add_dependency 'rakuten_web_service', '~> 1.9'

  spec.add_development_dependency 'ammeter', '~> 1.1', '>= 1.1.4'
  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
