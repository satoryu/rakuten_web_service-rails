# RakutenWebService::Rails
[![Gem Version](https://badge.fury.io/rb/rakuten_web_service-rails.svg)](https://badge.fury.io/rb/rakuten_web_service-rails)
[![CI](https://github.com/satoryu/rakuten_web_service-rails/workflows/CI/badge.svg)](https://github.com/satoryu/rakuten_web_service-rails/actions?query=workflow%3ACI)
[![Code Climate](https://codeclimate.com/github/satoryu/rakuten_web_service-rails/badges/gpa.svg)](https://codeclimate.com/github/satoryu/rakuten_web_service-rails)
[![Test Coverage](https://codeclimate.com/github/satoryu/rakuten_web_service-rails/badges/coverage.svg)](https://codeclimate.com/github/satoryu/rakuten_web_service-rails/coverage)
[![Issue Count](https://codeclimate.com/github/satoryu/rakuten_web_service-rails/badges/issue_count.svg)](https://codeclimate.com/github/satoryu/rakuten_web_service-rails)

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

This gem provides a generator to put configuration to access Rakuten Web Service.

```sh
$ rails generator rakuten_web_service:conig
```

Ater that, you will find `rakuten_web_service.yml` under the `config` directory.

  ```yaml
  development:
    application_id: DEV_APPLICATION_ID
    affiliate_id: DEV_AFFILIATE_ID

  test:
    application_id: TEST_APPLICATION_ID
    affiliate_id: TEST_AFFILIATE_ID

  production:
    application_id: <%= ENV['RWS_APPLICATION_ID'] %>
    affiliate_id: <%= ENV['RWS_AFFILIATE_ID'] %>
  ```

Replace `APPLICATION_ID` and `AFFILIATE_ID` with appropriate ones.

That's it!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/satoryu/rakuten_web_service-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

