Given(/^they are on the new flashcard page$/) do
  visit new_flashcard_path
end

Given(/^they have created a flashcard$/) do
  @user_flashcard = Flashcard.create!(
    question: "Why are we nice?",
    answer: "MINASWAN",
    user_id: @user.id,
    all_tags: "ruby matz"
  )
end

Given(/^they are on their flashcard page$/) do
  visit flashcard_path(@user_flashcard)
end

Given(/^there is a flashcard created by another user$/) do
  @user_2 = User.create!({
    email: "second@test.com",
    password: "password",
    password_confirmation: "password"
  })

  @non_user_flashcard = Flashcard.create!(
    question: "Why?",
    answer: "Because.",
    user_id: @user_2.id,
    all_tags: "high-philosophy"
  )
end

When(/^they visit a flashcard page created by another user$/) do
  visit flashcard_path(@non_user_flashcard)
end

When(/^they visit an edit flashcard page that isn't theirs$/) do
  visit edit_flashcard_path(@non_user_flashcard)
end

Then(/^the flashcard should be deleted$/) do
  expect(Flashcard.count).to eq(0)
  expect(page).to have_content("Flashcard deleted")
end

Then(/^they should see a flashcard error$/) do
  expect(page).not_to have_css("form.edit_flashcard")
  expect(page).to have_content("You can't edit a flashcard that you didn't create!")
end

Then(/^there should be no edit flashcard button$/) do
  expect(page).not_to have_content("Edit Flashcard")
end

Then(/^the flashcard should be updated$/) do
  expect(page).to have_content("Why the lucky stiff?")
  expect(page).to have_content("J------n G------e")
end

Then(/^the flashcard should be created$/) do
  expect(page).to have_content("Why are we nice?")
  expect(page).to have_content("MINASWAN")
  expect(page).to have_content("ruby")
  expect(page).to have_content("ruby-on-rails")
  expect(page).to have_content("uniq-tag")
end

Then(/^they should see a properly formatted flashcard$/) do
  expect(page).to have_css("i", text: "italic")
  expect(page).to have_css("b", text: "bold")
  expect(page).to have_css("span.code-block", text: "</code snippet>")
  expect(page).to have_css("span.code-inline", text: "@inline_code")
end
