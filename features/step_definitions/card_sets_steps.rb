Given(/^they are on the new card set page$/) do
  visit new_card_set_path
end

Given(/^they have created a card set$/) do
  @user_card_set = CardSet.create!(
    title: "Ruby Intermediate",
    user_id: @user.id
  )
end

Given(/^they are on their card set page$/) do
  visit card_set_path(@user_card_set)
end

Given(/^there is a card set created by another user$/) do
  @user_2 = User.create!({
    email: "second@test.com",
    password: "password",
    password_confirmation: "password"
  })
  
  @non_user_card_set = CardSet.create!(
    title: "Ruby Intermediate",
    user_id: @user_2.id
  )
end

When(/^they visit a card set page created by another user$/) do
  visit card_set_path(@non_user_card_set)
end

When(/^they visit an edit card set page that isn't theirs$/) do
  visit edit_card_set_path(@non_user_card_set)
end

Then(/^they should see a card set error$/) do
  expect(page).not_to have_css("form.edit_card_set")
  expect(page).to have_content("You can't edit a card set that you didn't create!")
end

Then(/^there should be no edit card set button$/) do
  expect(page).not_to have_content("Edit Card Set")
end

Then(/^the card set should be created$/) do
  expect(CardSet.count).to eq(1)
  expect(CardSet.last.title).to eq("Ruby Basics")
end

Then(/^the card set should be updated$/) do
  expect(page).to have_content("Ruby Expert")
end

Then(/^the card set should be deleted$/) do
  expect(CardSet.count).to eq(0)
  expect(page).to have_content("Card set deleted")
end