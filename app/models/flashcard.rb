class Flashcard < ApplicationRecord
  has_many :flashcard_tags, dependent: :destroy
  has_many :tags, through: :flashcard_tags
  has_many :card_set_flashcards
  has_many :card_sets, through: :card_set_flashcards
  belongs_to :user
  
  validates :question, :answer, :user_id, :all_tags, presence: true
  
  def all_tags=(names)
    self.tags = names.split(" ").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
  
  def all_tags
    self.tags.map(&:name).join(" ")
  end
end
