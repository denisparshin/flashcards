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
      flash[:notice] = "Успешно обновили карточку"
       redirect_to cards_path
    else
      flash.now[:error] = "Ошибка. Проверьте поля"
      render 'edit'
    end
  end

  def create
    @card = Card.new(card_params)
    if @card.save  
      redirect_to cards_path
    else
      render :new
    end
  end

  def destroy
    @card.destroy
      redirect_to cards_path
  end

  def set_card
    @card = Card.find(params[:id])
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end

end
