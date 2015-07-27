require 'active_support/testing/autorun'

require 'active_support'
require 'active_record'

require 'mini_fixtures'

TEST_ROOT = Pathname(File.dirname(__FILE__))
TEST_DB   = TEST_ROOT.join('db', 'test.sqlite3')

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: TEST_DB.to_path
)

class User < ActiveRecord::Base; end

class Category < ActiveRecord::Base
  has_many :items
end

class Item < ActiveRecord::Base
  belongs_to :category
end

unless File.exist?(TEST_DB)
  class CreateTestSchema < ActiveRecord::Migration
    def change
      create_table :users do |t|
        t.string :login
      end

      create_table :categories do |t|
        t.string :name
      end

      create_table :items do |t|
        t.string :name
        t.belongs_to :category
      end
    end
  end
  CreateTestSchema.migrate :up
end

class ActiveSupport::TestCase
  include ActiveRecord::TestFixtures

  self.fixture_path = TEST_ROOT.join('fixtures')
  self.test_order = :random
  self.use_transactional_fixtures = true
end

Minitest.backtrace_filter = Minitest::BacktraceFilter.new
