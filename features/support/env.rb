require 'rubygems'
require 'selenium-webdriver'

browser = ENV['BROWSER'] || 'chrome'

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

# Go fullscreen
Before do
  @browser.manage.window.maximize
end

# Reinit driver after each scenario
After '@feature' do
  @browser.quit
end
