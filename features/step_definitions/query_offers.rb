Given(/^I click "(.*?)" button$/) do |arg1|
  within("#offers-form") do
    find(".button").click
  end
  #save_and_open_page
end

Then(/^I should see a message "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end

Then(/^I should not see a message "(.*?)"$/) do |arg1|
  page.should_not have_content(arg1)
end

Given(/^I provide user param "(.*?)"$/) do |arg1|
  within("#offers-form") do
    fill_in('pub0', :with => arg1)
  end
end