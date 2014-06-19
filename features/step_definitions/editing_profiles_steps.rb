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

When(/^I visit the 'edit profile' page for any organisation's profile$/) do
  org = FactoryGirl.create(:organisation)
  visit edit_profile_path(org.profile)
end

When(/^I visit the 'edit profile' page for a profile that is not mine$/) do
  other = FactoryGirl.create(:another_organisation)
  visit edit_profile_path(other.profile)
end

Then(/^I should be redirected to the home page$/) do
  current_path.should == root_path
end

Then(/^I should see an error message '(.+)'$/) do |msg|
  expect(page).to have_content(msg)
end
