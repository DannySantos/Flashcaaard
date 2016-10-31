Given(/^they are on the new flashcard page$/) do
  visit new_flashcard_path
end

Given(/^they have created a flashcard$/) do
  @user_flashcard = Flashcard.create!(
    question: "Why are we nice?",
    answer: "MINASWAN",
    user_id: @user.id
  )
end

Given(/^they are on their flashcard page$/) do
  visit flashcard_path(@user_flashcard)
end

Then(/^the flashcard should be updated$/) do
  expect(page).to have_content("Why the lucky stiff?")
  expect(page).to have_content("J******n G******e")
end

Then(/^the flashcard should be created$/) do
  expect(page).to have_content("Why are we nice?")
  expect(page).to have_content("MINASWAN")
end