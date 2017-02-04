class AccountInformation < ApplicationRecord
validates :first_name,:last_name ,:presence => true

validates :zipcode ,:presence => true,
                    :length => {:is => 6 }


end
