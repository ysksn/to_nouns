# ToNouns

Using `MeCab` for Retrieving nouns from self.

## Installation

### Prerequisites

Make sure following dependencies are installed.

* `mecab`
* `libmecab-dev`
* `mecab-ipadic-utf8`

If `Ubuntu` is running on your machine, these are how you install dependencies:

```shell
sudo apt-get install mecab libmecab-dev mecab-ipadic-utf8
```

Add this line to your application's `Gemfile`:

```ruby
gem 'to_nouns', require: false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_nouns

## Usage

The base class must have instance method `:to_s`, but not `:to_nouns`.

```ruby
require 'to_nouns'

class String
  include ToNouns
end

'私は現在、北海道旭川市に住んでいます。'.to_nouns
=> ["私", "現在", "北海道", "旭川", "市"]

'私は現在、北海道旭川市に住んでいます。'.to_nouns(general: true)
=> ["私"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ysksn/to_nouns. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ToNouns project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ysksn/to_nouns/blob/master/CODE_OF_CONDUCT.md).
