class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @flashcards = FlashcardTag.where(tag_id: @tag.id)
  end

  def autocomplete
    render json: Tag.search(params[:query], autocomplete: true, limit: 10).map(&:name)
  end
end
