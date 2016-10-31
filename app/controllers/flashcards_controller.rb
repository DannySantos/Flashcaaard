class FlashcardsController < ApplicationController
  def new
    @flashcard = Flashcard.new
  end
  
  def create
    @flashcard = Flashcard.new(flashcard_params)
  
    if @flashcard.save
      redirect_to flashcard_path(@flashcard)
    else
      render :new
    end
  end
  
  def show
    @flashcard = Flashcard.find(params[:id])
  end
  
  private
  
  def flashcard_params
    params.require(:flashcard).permit(:question, :answer)
  end
end
