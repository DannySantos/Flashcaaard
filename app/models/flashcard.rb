class Flashcard < ApplicationRecord
  belongs_to :user
  validates :question, :answer, :user_id, presence: true
end
