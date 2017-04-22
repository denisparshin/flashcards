class TrainerController < ApplicationController
  
  def index
    @cards = Card.all
    @card = @cards.pending.first
  end
 
 def check_word

    result = CheckCard.call(
    card_id: params[:card_id],
    translation: params[:translation]
    )

    if result.success?
      redirect_to trainer_path, notice: result.notice
    end
  
end
  
end
