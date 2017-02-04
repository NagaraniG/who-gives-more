class Basket < ApplicationRecord
   
  validates :name ,:presence=>true
  has_many :user_baskets
  has_many :users, through: :user_baskets 
  has_one :picture ,as: :imageable
  accepts_nested_attributes_for :picture
end
