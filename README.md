# Mini Fixtures

[![Build Status](https://travis-ci.org/hidakatsuya/mini_fixtures.svg?branch=master)](https://travis-ci.org/hidakatsuya/mini_fixtures)

An extension of the ActiveRecord Fixtures that provides a feature to separate it to small sets.

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
  mini_fixtures 'case_a', :all
end

class BarScenarioTest < ActionDispatch::IntegrationTest
  mini_fixtures 'case_b/subcase_b2', :all
end

class UserTest < ActiveSupport::TestCase
  mini_fixtures 'case_b', :users
end
```

## Supported versions

  * Ruby 2.0, 2.1, 2,2
  * Rails 4.1, 4.2

## Install

Put this line in your Gemfile:

    gem 'mini_fixtures', group: :test

Then bundle:

    % bundle

## Usage

Please see `*_test.rb` in  [test/integration](https://github.com/hidakatsuya/mini_fixtures/tree/master/test/integration).

### DON'T DO THIS

```ruby
class FooTest < ActiveSupport::TestCase
  mini_fixtures 'case_a', :users
  mini_fixtures 'case_b', :users
end
```

In this code, `case_b/users.yml` will be loaded, but `case_a/users.yml` will be **ignored**.

## Questions, Feedback

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/hidakatsuya/mini_fixtures?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge), or feel free to message me on GitHub or Twitter (@hidakatsuya)

## Contributing

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Added some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request

## Copyright

&copy; Katsuya HIDAKA. See MIT-LICENSE for further details.
