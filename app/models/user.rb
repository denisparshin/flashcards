class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :cards

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true
  
end
