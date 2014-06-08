Given(/^I am not logged in$/) do
  page.driver.submit :delete, "/organisations/sign_out", {}
end

Given(/^I am logged in$/) do
  email = 'testing@man.net'
  password = 'secretpass'
  Organisation.new(:email => email, 
  	:password => password, 
  	:password_confirmation => password,
  	:confirmed_at => Time.now).save!

  visit '/organisations/sign_in'
  fill_in "organisation_email", :with => email
  fill_in "organisation_password", :with => password
  click_button "Sign in"
end

Given(/^I am a registered user$/) do
  email = 'testing@man.net'
  password = 'secretpass'
  Organisation.new(:email => email, :password => password, :password_confirmation => password).save!
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

When(/^I click the 'Login' link$/) do
  click_link 'login-link'
end

When(/^I click the 'Password forgotten' link$/) do
  click_link 'password-forgotten-link'
end

When(/^I fill in my email$/) do
  email = 'testing@man.net'
  fill_in "organisation_email", :with => email
end

When(/^I push the 'Send me reset password instructions' button$/) do
  click_button 'Send me reset password instructions'
end


Then(/^I should be sent an email with instructions$/) do	  
  last_email = ActionMailer::Base.deliveries.last
  expect(last_email.to).to eq ['testing@man.net']  
  expect(last_email.subject).to have_content 'Reset password instructions'
  expect(last_email.body).to have_content 'link to change your password'
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
