class CheckCard 
  
  include Interactor 

  def call 
    card = Card.find(context.card_id)
    
    if context.translation == card.translated_text
      card.update(review_date: 3.days.since)
      context.notice = "Правильно! :)"
    else
      context.notice = "Не верно! :)"
    end
  end
 
 
end