Given(/^Some animals are registered/) do
  @animal = FactoryGirl.create(:animal)
end

Then(/^I should see a link to a list of registered animals$/) do
  expect(page).to have_selector('#animals-list-link')
end

Then(/^if I click on the 'List of registered animals' list$/) do
  click_link 'animals-list-link'
end

Then(/^I should see a list of every animal registered in the system$/) do
  expect(page).to have_selector('table tr th')
  expect(page).to have_selector('table tr td', text: FactoryGirl.attributes_for(:animal)['name'])
end

When(/^I visit the list of animals$/) do
  visit '/animals'
end

When(/^I click on the name of an animal$/) do
  click_link('MyAnimal')
end

Then(/^I should see the 'show animal' page$/) do
  expect(current_path).to eq(animal_path(@animal))
end
