require 'rubygems'
require 'selenium-webdriver'

main_page = 'http://www.google.com/'
browser = 'chrome'

## Creating WebDriver
# Init path to drivers
Selenium::WebDriver::Firefox.driver_path = './drivers/geckodriver.exe'
Selenium::WebDriver::Chrome.driver_path = './drivers/chromedriver.exe'

# Init driver
Before do
  @browser =
  if browser == 'chrome'
    Selenium::WebDriver.for :chrome
  else
    Selenium::WebDriver.for :firefox
  end
end

# Open url, go fullscreen and wait to be ready
Before do
  @browser.get main_page
  @browser.manage.window.maximize
  @browser.manage.timeouts.implicit_wait = 20 # sec
end

# Reinit driver after each scenario
After '@future' do
  @browser.quit
end
