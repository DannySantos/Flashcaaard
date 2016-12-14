class Tag < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  searchkick autocomplete: ['name']

  has_many :flashcard_tags
  has_many :flashcards, through: :flashcard_tags
end

Tag.import