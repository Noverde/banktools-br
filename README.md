# BanktoolsBR

This gem to normalize, validate and prettify brazilian bank account and agencies according to the bank.

## Support

This gem supports the follow bank account validations:

* Banrisul
* BB
* Bradesco
* Caixa Economica
* Citybank
* HSBC
* Itau
* Santander

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'banktools-br'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install banktools-br

## Usage

```ruby
agency = BanktoolsBR::Agency.new('001', '1584')
agency.valid? # true

account = BanktoolsBR::Account.new('001', '1584', '002.101.69-6')
account.valid? # true
account.to_s # 00210169-6
```

## TODO

Implement digit validation for the follow bank agencies:

* BB
* Banrisul
* Bradesco

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Noverde/banktools-br.

