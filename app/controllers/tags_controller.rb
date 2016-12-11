class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @flashcards = FlashcardTag.where(tag_id: @tag.id)
  end
end