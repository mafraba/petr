Then(/^I should see a link to edit my profile$/) do
  expect(page).to have_selector('#edit-profile-link')
end

Then(/^if I click on the 'Edit profile' link$/) do
  click_link 'edit-profile-link'
end

Then(/^I update my name to '(.+)'$/) do |name|
  fill_in "profile_name", :with => name
  click_button 'Save'
end

Then(/^My profile should be updated with my new name '(.+)'$/) do |name|
  expect(Profile.where(name: name)).to exist()
end
