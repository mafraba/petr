Given(/^I am not logged in$/) do
  page.driver.submit :delete, "/organisations/sign_out", {}
end

Given(/^I am logged in$/) do
  email = 'testing@man.net'
  password = 'secretpass'
  Organisation.new(:email => email, :password => password, :password_confirmation => password).save!

  visit '/organisations/sign_in'
  fill_in "organisation_email", :with => email
  fill_in "organisation_password", :with => password
  click_button "Sign in"
end



When(/^I click the 'Sign Up' link$/) do
  click_link 'signup-link'
end

When(/^I fill my data$/) do
  email = 'testing@man.net'
  password = 'secretpass'

  fill_in "organisation_email", :with => email
  fill_in "organisation_password", :with => password
  fill_in "organisation_password_confirmation", :with => password
end

When(/^I submit the signup form$/) do
  click_button "Sign up"
end

Then(/^I should have registered myself as an organisation$/) do
  expect(Organisation).to exist(email: 'testing@man.net')
end




Then(/^I should see a 'Sign up' link$/) do
  expect(page).to have_selector('#signup-link')
end

Then(/^I should see a 'Login' link$/) do
  expect(page).to have_selector('#login-link')
end

Then(/^I should see a 'Edit profile' link$/) do
  expect(page).to have_selector('#edit-profile-link')
end

Then(/^I should see a 'Logout' link$/) do
  expect(page).to have_selector('#logout-link')
end
