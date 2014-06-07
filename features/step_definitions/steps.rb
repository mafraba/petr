When(/^I visit the home page$/) do
  visit '/'
end

Then(/^I should see a welcome message$/) do
  expect(page).to have_selector('main article#welcome')
end

Then(/^I should see a description of the system's main purposes$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see what the system offers to individuals$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see what the system offers to organizations$/) do
  pending # express the regexp above with the code you wish you had
end
