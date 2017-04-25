require 'rails_helper'

describe Card do
  it 'create card with empty original text' do
    card = Card.create(original_text: '', translated_text: 'word')
    expect(card.errors[:original_text]).to include("can't be blank")
end

 it 'create card with empty translated text' do
    card = Card.create(original_text: 'word', translated_text: '')
    expect(card.errors[:translated_text]).to include("can't be blank")
end

it 'create card with equal words' do
    card = Card.create(original_text: 'word', translated_text: 'word')
    expect(card.errors[:translated_text]).to include("Тексты не могут быть одинаковыми")
end

it 'create card errors' do
    card = Card.create(original_text: 'word', translated_text: 'words')
    expect(card.errors.any?).to be false
end

 it 'set_review_date_as_now' do
    card = Card.create(original_text: 'дом', translated_text: 'house')
     expect(card.review_date.strftime("%d/%m/%Y")).to eq((card.created_at + 3.days).strftime("%d/%m/%Y"))
end
end