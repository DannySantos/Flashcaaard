class FlashcardTag < ApplicationRecord
  belongs_to :flashcard
  belongs_to :tag
end
