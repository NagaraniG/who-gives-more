# json.extract! donation, :id,:firstname_on_card,:lastname_on_card,:card_number,:expiration_date,:cvv,:billing_address,:amount,:user_id,:team_id,:created_at, :updated_at
# json.url team_url(team, format: :json)

json.status :success
json.donation do 
  json.id  donation.id
  json.firstname_on_card donation.firstname_on_card
  json.lastname_on_card donation.lastname_on_card
  json.card_number donation.card_number
  json.expiration_date donation.expiration_date
  json.cvv donation.cvv
  json.billing_address donation.billing_address
  json.amount donation.amount
  json.user_id donation.user_id
  json.team_id donation.team_id 
  end