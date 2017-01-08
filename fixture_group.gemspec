$:.push File.expand_path('../lib', __FILE__)

require 'fixture_group/version'

Gem::Specification.new do |s|
  s.name        = 'fixture_group'
  s.version     = FixtureGroup::VERSION
  s.authors     = ['Katsuya HIDAKA']
  s.email       = ['hidakatsuya@gmail.com']
  s.homepage    = 'https://github.com/hidakatsuya/fixture_group'
  s.summary     = 'An extension of the ActiveRecord Fixtures ' \
                  'that make possible to create fixtures group'
  s.description = 'FixtureGroup is an extension of the ActiveRecord Fixtures ' \
                  'that make possible to create fixtures group'
  s.license     = 'MIT'
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.3'

  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep %r{^test/}
  s.require_paths = ['lib']

  s.add_dependency 'activerecord', '>= 4.2'
  s.add_dependency 'activesupport', '>= 4.2'
  s.add_development_dependency 'rake', '>= 10.0'
  s.add_development_dependency 'sqlite3', '>= 1.3'
end
