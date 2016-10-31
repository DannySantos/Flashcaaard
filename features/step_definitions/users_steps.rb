Given(/^they are on the registration page$/) do
  visit new_user_registration_path
end

When(/^they fill in the "([^"]*)" field with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end

When(/^they click on "([^"]*)"$/) do |value|
  click_on value
end

Then(/^a User should be created$/) do
  expect(User.last.email).to eq('test@test.com')
end
