require 'rubygems'
require 'selenium-webdriver'

browser = ENV['BROWSER'] || 'edge'
@main_page_url = 'http://www.google.com/'

## Creating WebDriver
# Init path to drivers
Selenium::WebDriver::Firefox.driver_path = './drivers/geckodriver.exe'
Selenium::WebDriver::Chrome.driver_path = './drivers/chromedriver.exe'
Selenium::WebDriver::Edge.driver_path = './drivers/MicrosoftWebDriver.exe'

# Init driver
Before do
  @browser = case browser
               when 'chrome'
                 Selenium::WebDriver.for :chrome
               when 'edge'
                 Selenium::WebDriver.for :edge
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
