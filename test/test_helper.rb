require 'active_support'
require 'active_record'
require 'mini_fixtures'

TEST_ROOT = Pathname(File.dirname(__FILE__))
$:.push TEST_ROOT.to_s
