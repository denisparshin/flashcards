class CardsController < ApplicationController
  
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
 
    if @card.update(card_params)
      redirect_to(:action => 'index')
    else
      render 'edit'
    end
  end

  def create
    @card = Card.new(card_params)
    @card.review_date = Time.now
    if @card.save  
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def destroy
    @card = Card.destroy(params[:id])
    redirect_to(:action => 'index')
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end

end
