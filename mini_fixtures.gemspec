$:.push File.expand_path('../lib', __FILE__)

require 'mini_fixtures/version'

Gem::Specification.new do |s|
  s.name        = 'mini_fixtures'
  s.version     = MiniFixtures::VERSION
  s.authors     = ['Katsuya HIDAKA']
  s.email       = ['hidakatsuya@gmail.com']
  s.homepage    = 'https://github.com/hidakatsuya/mini_fixtures'
  s.summary     = 'An extension of the ActiveRecord Fixtures ' \
                  'that provides a feature to separate it to small sets'
  s.description = 'Mini-Fixtures is an extension of the ActiveRecord Fixtures ' \
                  'that provides a feature to separate it to small sets'
  s.license     = 'MIT'
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.0'

  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep %r{^test/}
  s.require_paths = ['lib']

  s.add_dependency 'activerecord', '>= 4.1'
  s.add_dependency 'activesupport', '>= 4.1'
  s.add_development_dependency 'rake', '>= 10.0'
  s.add_development_dependency 'sqlite3', '>= 1.3'
end
