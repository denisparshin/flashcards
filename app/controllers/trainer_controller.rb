class TrainerController < ApplicationController
  
  def index
    @cards = Card.all
    @card = @cards.pending.first
  end
 
  def check_word
    @card = Card.find(params[:card_id])
    

    check_result = @card.check_translation(trainer_params[:translation])
      
    if check_result == @card.translated_text.downcase
      @card.update(review_date: 3.days.since)
      flash[:notice]  = "Правильно! :)"
    else
      flash.now[:error] = " Не верно! :("
    end
      redirect_to trainer_path
     
  end
  
  private

  def trainer_params
    params.permit(:translation)
  end

end
