class Tag < ApplicationRecord
  searchkick autocomplete: ['name']

  has_many :flashcard_tags
  has_many :flashcards, through: :flashcard_tags
end
