class CreateCardSetFlashcards < ActiveRecord::Migration[5.0]
  def change
    create_table :card_set_flashcards do |t|
      t.references :flashcard, foreign_key: true
      t.references :card_set, foreign_key: true

      t.timestamps
    end
  end
end
