class Flashcard < ApplicationRecord
  validates :question, :answer, :user_id, presence: true
end
