require 'rails_helper'

describe Card do
  it 'create card with empty original text' do
    expect { create(:card, original_text: '') }.to raise_error(
      ActiveRecord::RecordInvalid, /Original text can't be blank/
    )
  end

  it 'create card with empty translated text' do
    expect { create(:card, translated_text: '') }.to raise_error(
      ActiveRecord::RecordInvalid, /Translated text can't be blank/
    )
  end

  it 'create card with equal words' do
    expect { create(:card, original_text: 'word', translated_text: 'word') }
      .to raise_error(
        ActiveRecord::RecordInvalid, /Тексты не могут быть одинаковыми/
      )
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
