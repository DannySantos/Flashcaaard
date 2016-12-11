Given(/^there are some flashcards with a active\-record tag$/) do
  @ar_flashcard_1 = Flashcard.create!(
    question: "What is Active Record?",
    answer: "An ORM",
    user_id: @user.id,
    all_tags: "active-record ruby-on-rails" 
  )
  
  @ar_flashcard_2 = Flashcard.create!(
    question: "What is ORM?",
    answer: "Object-Relational Mapping is a programming technique for converting data between incompatible type systems. It converts object values into simpler values to store them in a database and converts them back upon retrieval.",
    user_id: @user.id,
    all_tags: "active-record databases"
  )
end

Given(/^there are some flashcards without a active\-record tag$/) do
  @non_ar_flashcard_1 = Flashcard.create!(
    question: "Who is Mars?",
    answer: "The Roman god of war",
    user_id: @user.id,
    all_tags: "mythology roman-mythology"
  )
  
  @non_ar_flashcard_2 = Flashcard.create!(
    question: "Who is Hades?",
    answer: "The Greek god of the underworld",
    user_id: @user.id,
    all_tags: "mythology greek-mythology"
  )
end

Given(/^they are on a flashcard page with an active\-record tag$/) do
  visit flashcard_path(@ar_flashcard_1)
end

Then(/^they see all of the flashcards with the active\-record tag$/) do
  expect(page).to have_content(@ar_flashcard_1.question)
  expect(page).to have_content(@ar_flashcard_2.question)
end

Then(/^they don't see flashcards without the active\-record tag$/) do
  expect(page).not_to have_content(@non_ar_flashcard_1.question)
  expect(page).not_to have_content(@non_ar_flashcard_2.question)
end