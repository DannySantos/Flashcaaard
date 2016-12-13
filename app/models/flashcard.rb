class Flashcard < ApplicationRecord
  has_many :flashcard_tags, dependent: :destroy
  has_many :tags, through: :flashcard_tags
  has_many :card_set_flashcards, dependent: :destroy
  has_many :card_sets, through: :card_set_flashcards
  belongs_to :user

  accepts_nested_attributes_for :card_set_flashcards

  validates :question, :answer, :user_id, :all_tags, presence: true
  
  searchkick autocomplete: ['all_tags']

  def all_tags=(names)
    self.tags = names.split(" ").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(" ")
  end

  def autocomplete
    render json: Tag.search(params[:flashcard][:all_tags], autocomplete: true, limit: 10)#.map(&:name)
  end
end
