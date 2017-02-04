# json.donations! @donations, partial: 'donations/donation', as: :donation
json.total Donation.sum('amount')
json.data @highest_donor, partial: 'donations/donation', as: :donation