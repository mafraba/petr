Given(/^Some organisations are registered in the system$/) do
	FactoryGirl.create(:organisation)
end

Then(/^I should see a link to a 'List of Organisations'$/) do
  expect(page).to have_selector('#organisations-list-link')
end

Then(/^I if I clink on that 'List of Organisations' link$/) do
  click_link 'organisations-list-link'
end

Then(/^I should see a list of every registered organisation$/) do
  expect(page).to have_selector('#organisations-list')
end
