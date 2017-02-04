class UserBasket < ApplicationRecord
  belongs_to :user
  belongs_to :basket ,:optional=>true
end
