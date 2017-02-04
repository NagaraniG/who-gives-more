class Chartie < ApplicationRecord
  has_attached_file :pic, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\z/

  has_many :user_charties
  has_many :users, through: :user_charties
end
