class TrainerController < ApplicationController
  
  def index
    @card = Card.pending.first
      if @card 
        @card
      else
        redirect_to :back, notice: "Нет карточек для пересмотра"
      end
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
