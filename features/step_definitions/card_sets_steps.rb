Given(/^they are on the new card set page$/) do
  visit new_card_set_path
end

Then(/^the card set should be created$/) do
  expect(CardSet.count).to eq(1)
  expect(CardSet.last.title).to eq("Ruby Basics")
end