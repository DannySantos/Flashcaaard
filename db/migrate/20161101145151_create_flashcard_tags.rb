class CreateFlashcardTags < ActiveRecord::Migration[5.0]
  def change
    create_table :flashcard_tags do |t|
      t.references :flashcard, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
