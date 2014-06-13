Given(/^Some animals are registered in the system$/) do
  FactoryGirl.create(:animal)
end

Then(/^I should see a link to a list of registered animals$/) do
  expect(page).to have_selector('#animals-list-link')
end

Then(/^if I click on the 'List of registered animals' list$/) do
  click_link 'animals-list-link'
end

Then(/^I should see a list of every animal registered in the system$/) do
  expect(page).to have_selector('table tr th')
  expect(page).to have_selector('table tr td', text: "MyString")
  # Check that the organisation's email is shown
  expect(page).to have_selector('table tr td', text: "test@man.org")
end
