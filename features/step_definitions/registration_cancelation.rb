Then(/^I should see a link to manage my account$/) do
  expect(page).to have_selector('#manage-account-link')
end

Then(/^I should get to the account management page$/) do
  expect(current_path).to eq(edit_organisation_registration_path(@organisation))
end

When(/^I visit the account management page$/) do
  visit edit_organisation_registration_path(@organisation)
end

Then(/^I should see a button named '(.+)'$/) do |value|
  expect(page).to have_selector("input[value='#{value}']") 
end

Given(/^I have animals registered$/) do
  expect(@organisation.animals).not_to be_empty
  @animal = @organisation.animals.first
end

Then(/^I should be gone from the system along with my animals$/) do
  expect(Organisation.find_by_id(@organisation.id)).to be_nil
  expect(Animal.find_by_id(@animal.id)).to be_nil
end