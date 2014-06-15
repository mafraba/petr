Then(/^I should see a link to edit my profile$/) do
  expect(page).to have_selector('#edit-profile-link')
end

Then(/^if I click on the 'Edit profile' link$/) do
  click_link 'edit-profile-link'
end

Then(/^I update my name to '(.+)'$/) do |name|
  fill_in "name", :with => name
  click_button 'Update'
end

Then(/^I should see my profile updated with my new name '(.+)'$/) do |name|
  pending # express the regexp above with the code you wish you had
end
