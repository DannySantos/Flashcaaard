class FlashcardsController < ApplicationController
  def index
    @flashcards = Flashcard.all
  end
  
  def new
    @flashcard = Flashcard.new
  end
  
  def create
    @flashcard = Flashcard.new(flashcard_params)
    @flashcard.user_id = current_user.id
    
    if @flashcard.save
      if params[:card_set_flashcards]
        c = CardSetFlashcard.create(
          card_set_id: params[:card_set_flashcards][:card_set_id],
          flashcard_id: @flashcard.id  
        )
        
        redirect_to card_set_path(c.card_set_id)
      else
        redirect_to flashcard_path(@flashcard)
      end
    else
      render :new
    end
  end
  
  def edit 
    @flashcard = Flashcard.find(params[:id])
  end
  
  def show
    @flashcard = Flashcard.find(params[:id])
    @tags = get_tags(@flashcard)
  end
  
  def update
    @flashcard = Flashcard.find(params[:id])
    
    if @flashcard.update(flashcard_params)
      redirect_to flashcard_path(@flashcard)
    else
      render :edit
    end
  end
  
  def destroy
    @flashcard = Flashcard.find(params[:id]).destroy
    flash[:notice] = "Flashcard deleted"
    redirect_to root_path
  end
  
  private
  
  def flashcard_params
    params.require(:flashcard).permit(:question, :answer, :all_tags)
  end
  
  def get_tags(flashcard)
    tags = []
    
    @flashcard.all_tags.split(" ").each do |tag_name|
      tags << Tag.where(name: tag_name).first
    end
    
    tags
  end
end
