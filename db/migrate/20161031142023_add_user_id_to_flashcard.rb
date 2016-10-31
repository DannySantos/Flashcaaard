class AddUserIdToFlashcard < ActiveRecord::Migration[5.0]
  def change
    add_reference :flashcards, :user, foreign_key: true
  end
end
