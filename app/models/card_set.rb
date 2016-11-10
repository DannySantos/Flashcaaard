class CardSet < ApplicationRecord
  has_many :card_set_flashcards
  has_many :flashcards, through: :card_set_flashcards
  belongs_to :user
end
