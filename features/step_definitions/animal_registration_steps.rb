When(/^I click the link to register an animal$/) do
  click_link 'animal-registration-link'
end

When(/^I fill in and submit the necessary animal's data$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the animal gets registered in the system$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a link to register an animal$/) do
  expect(page).to have_selector('#animal-registration-link')
end

Then(/^I should not see a link to register an animal$/) do
  expect(page).to_not have_selector('#animal-registration-link')
end