Bundler.require(:test)
Dir[File.dirname(__FILE__) + '/../model/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.disable_monkey_patching!
  # config.warnings = true
  config.after(login_feature: true) do
    Capybara.reset_sessions!
  end
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.configure do |config|
  config.current_driver = :chrome
  config.app_host = 'http://demoapp.strongqa.com/'
end
