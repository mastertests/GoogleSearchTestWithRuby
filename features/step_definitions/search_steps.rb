# frozen_string_literal: true

search_field_name = 'q'
search_result_title = 'h3.LC20lb'

When /^I input "([^"]*)" in search field$/ do |term|
  @element = @browser.find_element name: search_field_name
  @element.send_keys term
end

When /^I press submit$/ do
  @element.submit
end

Then /^I should see "([^"]*)" in search result$/ do |term|
  @result_list = []
  @elements = @browser.find_elements css: search_result_title
  @elements.each do |element|
    @result_list << element.text.include?(term)
  end
  raise 'Fail' if @result_list.size != @elements.size
end

Then /^I should see element with "([^"]*)" "([^"]*)"$/ do |locator_type, locator|
  element = @browser.find_element "#{locator_type}": locator
  raise 'Fail' unless element.displayed?
end
