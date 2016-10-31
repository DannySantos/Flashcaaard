Given(/^they are on the new flashcard page$/) do
  visit new_flashcard_path
end

Then(/^the flashcard should be created$/) do
  expect(page).to have_content("Why are we nice?")
  expect(page).to have_content("MINASWAN")
end