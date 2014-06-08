Given(/^I am not logged in$/) do
  page.driver.submit :delete, "/users/sign_out", {}
end

Then(/^I should see a 'Sign up' link$/) do
  expect(page).to have_selector('#signup-link')
end

Then(/^I should see a 'Login' link$/) do
  expect(page).to have_selector('#login-link')
end