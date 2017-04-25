require 'rails_helper'

describe CheckCard do
  
  it "check card translate true" do
     card = Card.create(id:"1", original_text: "word", translated_text: "house")
    result = CheckCard.call(
    card_id: "1",
    translation: "house",
    translated_text: "house"
    )
    expect(card.review_date.strftime('%d-%m-%Y')).to eq(3.days.since.strftime('%d-%m-%Y'))
    expect(result.notice).to eq("Правильно! :)")
  end

  it "check card translate true" do
     card = Card.create(id:"1", original_text: "word", translated_text: "house")
    result = CheckCard.call(
    card_id: "1",
    translation: "word",
    translated_text: "house"
    )
    expect(card.review_date.strftime('%d-%m-%Y')).to eq(3.days.since.strftime('%d-%m-%Y'))
    expect(result.notice).to eq("Не верно! :)")
  end

end