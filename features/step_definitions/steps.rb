When(/^I visit the home page$/) do
  visit '/'
end

When(/I click on '(.+)'/) do |name|
	click_on name
end

Then(/^I should see a welcome message$/) do
  expect(page).to have_selector('main article#welcome')
end

Then(/^I should see a description of the system's main purposes$/) do
  expect(page).to have_selector('main article #purpose')
end

Then(/^I should see what the system offers to individuals$/) do
  expect(page).to have_selector('main article #tools_for_individuals')
end

Then(/^I should see what the system offers to organizations$/) do
  expect(page).to have_selector('main article #tools_for_organisations')
end
