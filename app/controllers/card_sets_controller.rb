class CardSetsController < ApplicationController
  def new
    @card_set = CardSet.new
  end
  
  def create
    @card_set = CardSet.new(card_set_params)
    
    if @card_set.save
      redirect_to card_set_path(@card_set)
    else
      render :new
    end
  end
  
  def show
    @card_set = CardSet.find(params[:id])
  end
  
  private
  
  def card_set_params
    params.require(:card_set).permit(:title)
  end
end