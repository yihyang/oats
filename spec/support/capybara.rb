require 'capybara/rails'
require 'capybara/rspec'
require 'selenium/webdriver'

# By default Capybara will use Selenium+Firefox for `js:true` feature specs.
# The following lines will tell Capybara to use Chrome instead of Firefox,
# :nocov:
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w(headless disable-gpu) }
  )

  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    desired_capabilities: capabilities
end

# NOTE: Change the following to see the browser testing
Capybara.javascript_driver = :headless_chrome
