ENV["RAILS_ENV"] ||= "test"

require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "capybara/rails"
require "shoulda/matchers"
require "database_cleaner"
require "pundit/rspec"

Dir[Rails.root.join("spec", "support", "**", "*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!
RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.include FactoryGirl::Syntax::Methods
  config.include Features::SessionHelpers, type: :feature
  config.include Warden::Test::Helpers
  config.before :suite do
    Warden.test_mode!
  end
  config.infer_spec_type_from_file_location!
end
