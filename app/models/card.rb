class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validate :not_equal

  before_validation :set_review_date_as_now, on: :create
  scope :pending, -> { where('review_date <= ?', Time.now).order('RANDOM()') }

  def not_equal
    if original_text.downcase == translated_text.downcase
      errors.add(:translated_text, 'Тексты не могут быть одинаковыми')
    end
  end

  def set_review_date_as_now
    self.review_date = 3.days.from_now
  end 

  
  
end
