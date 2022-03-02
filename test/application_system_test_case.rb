require "test_helper"

Dir[Rails.root.join('test/support/**/*.rb')].each { |f| require f }

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium_chrome_headless, screen_size: [1400, 1400]
  include AuthenticationsMacros
end
