class Donation < ApplicationRecord
  validates :firstname_on_card,:lastname_on_card,:expiration_date,:billing_address,:amount ,:presence => true
  validates :card_number ,:presence => true,
                          :length=> {:is=>16}
                          # :uniqueness => true
  validates :cvv ,:presence => true,
                :uniqueness=>true,
                :length => {:is => 3 }
end
