class CardSetsController < ApplicationController
  def new
    @card_set = CardSet.new
  end
  
  def edit
    @card_set = CardSet.find(params[:id])
  end
  
  def create
    @card_set = CardSet.new(card_set_params)
    @card_set.user_id = current_user.id
    
    if @card_set.save
      redirect_to card_set_path(@card_set)
    else
      render :new
    end
  end
  
  def update
    @card_set = CardSet.find(params[:id])
    
    if @card_set.update(card_set_params)
      redirect_to @card_set
    else
      render :edit
    end
  end
  
  def show
    @card_set = CardSet.find(params[:id])
    @flashcard = Flashcard.new
  end
  
  def destroy
    CardSet.find(params[:id]).destroy
    flash[:notice] = "Card set deleted"
    redirect_to root_path
  end
  
  private
  
  def card_set_params
    params.require(:card_set).permit(:title)
  end
end