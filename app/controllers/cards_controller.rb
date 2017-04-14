class CardsController < ApplicationController
  
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def show
  end

  def update
    if @card.update(card_params)
      redirect_to(:index)
    else
      render 'edit'
    end
  end

  def create
    @card = Card.new(card_params)
    if @card.save  
      redirect_to(:index)
    else
      render :new
    end
  end

  def destroy
    @card = Card.destroy()
    redirect_to(:index)
  end

  def set_card
    @card = Card.find(params[:id])
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end

end
