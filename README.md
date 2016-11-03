# RakutenWebService::Rails

The gem provides an initializer to load the configuration for accessing Rakuten Web Service from YAML file in your Rails app's `config` directory.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rakuten_web_service-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rakuten_web_service-rails

## Usage

Put your configuration to access Rakuten Web Service, application ID and affiliate ID, in YAML to `/path/to/your_rails_app/config/rakuten_web_service.yml` like:

  ```yaml
  development:
    application_id: 'your application id' # Required
    affiliate_id: 'your affiliate id' # Optional

  test:
    application_id: 'your application id' # Required
    affiliate_id: 'your affiliate id' # Optional

  production:
    application_id: <%= ENV['RAS_APPLICATION_ID'] %> # This configuration file is dealt as ERB
  ```

That's it!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/satoryu/rakuten_web_service-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

