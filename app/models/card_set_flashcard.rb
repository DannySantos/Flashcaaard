class CardSetFlashcard < ApplicationRecord
  belongs_to :flashcard
  belongs_to :card_set
end
