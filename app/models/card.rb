class Card < ApplicationRecord
	validates :original_text, :translated_text, :review_date, presence: true
	validate :not_equal
	def not_equal
      if original_text.downcase == translated_text.downcase
        errors.add(:translated_text, 'Тексты не могут быть одинаковыми')
      end
    end
 
end
