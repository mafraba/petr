When(/^I visit the home page$/) do
  visit '/'
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
  pending # express the regexp above with the code you wish you had
end
