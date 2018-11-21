# frozen_string_literal: true

main_page_url = @main_page_url

search_field_name_locator = 'q'
search_result_title_locator = 'h3.LC20lb'

Given(/^I open main page$/) do
  @browser.get main_page_url
end

When(/^I input "([^"]*)" in search field$/) do |term|
  @element = @browser.find_element name: search_field_name_locator
  @element.send_keys term
end

When(/^I press submit$/) do
  @element.submit
end

Then(/^I should see "([^"]*)" in search results$/) do |term|
  result_list = Array[]
  elements = @browser.find_elements css: search_result_title_locator
  elements.each do |element|
    result_list << element.text.include?(term)
  end
  raise 'Fail because not all result contain search term text' if result_list.size != elements.size
end

Then(/^I should see element with "([^"]*)" "([^"]*)"$/) do |locator_type, locator|
  element = @browser.find_element "#{locator_type}": locator
  raise "Fail because element #{locator} is not displayed" unless element.displayed?
end
