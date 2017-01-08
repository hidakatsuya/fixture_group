# Fixture Group

[![Gem Version](https://badge.fury.io/rb/fixture_group.svg)](http://badge.fury.io/rb/fixture_group)
[![Build Status](https://travis-ci.org/hidakatsuya/fixture_group.svg?branch=master)](https://travis-ci.org/hidakatsuya/fixture_group)
[![Code Climate](https://codeclimate.com/github/hidakatsuya/fixture_group/badges/gpa.svg)](https://codeclimate.com/github/hidakatsuya/fixture_group)

An extension of the ActiveRecord Fixtures that make possible to create fixtures group.

## Features

```
Rails.root/
 `- test/
     `- fixtures/
         |- case_a/
         |   |- users.yml
         |   `- items.yml
         `- case_b/
             |- subcase_b1/
             |   |- users.yml
             |   `- items.yml
             `- subcase_b2/
                 |- users.yml
                 `- items.yml
```

```ruby
class FooControllerTest < ActiveSupport::TestCase
  fixture_group 'case_a', :all
end

class BarScenarioTest < ActionDispatch::IntegrationTest
  fixture_group 'case_b/subcase_b2', :all
end

class UserTest < ActiveSupport::TestCase
  fixture_group 'case_b', :users
end
```

## Supported versions

  * Ruby 2.3 + ActiveRecord 4.2, 5.0
  * Ruby 2.4 + ActiveRecord 5.0

## Install

Put this line in your Gemfile:

    gem 'fixture_group', group: :test

Then bundle:

    % bundle

## Usage

Please see `*_test.rb` in  [test/integration](https://github.com/hidakatsuya/fixture_group/tree/master/test/integration).

### DON'T DO THIS

```ruby
class FooTest < ActiveSupport::TestCase
  fixture_group 'case_a', :users
  fixture_group 'case_b', :users
end
```

In this code, `case_b/users.yml` will be loaded, but `case_a/users.yml` will be **ignored**.

## Questions, Feedback

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/hidakatsuya/fixture_group?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

or, feel free to message me on GitHub or Twitter (@hidakatsuya)

## Contributing

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Added some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request

## Copyright

&copy; Katsuya HIDAKA. See MIT-LICENSE for further details.
