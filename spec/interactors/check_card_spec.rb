require 'rails_helper'

describe CheckCard do
  
  it "check card translate true" do
    card = Card.create(original_text: 'word', translated_text: 'house')
    result = CheckCard.call(
    card_id: card.id,
    translation: "house"
  )
    expect(card.review_date.strftime('%d-%m-%Y')).to eq(3.days.since.strftime('%d-%m-%Y'))
    expect(result.notice).to eq("Правильно! :)")
  end

  it "check card translate false" do
    card = Card.create(id:"15", original_text: "word", translated_text: "house")
    result = CheckCard.call(
    card_id: "15",
    translation: "word",
    translated_text: "house"
    )
    expect(card.review_date.strftime('%d-%m-%Y')).to eq(3.days.since.strftime('%d-%m-%Y'))
    expect(result.notice).to eq("Не верно! :)")
  end

end
