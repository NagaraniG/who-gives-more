# json.extract! account_information, :id,:first_name,:last_name,:address1,:address2,:zipcode,:dob,:user_id,:created_at, :updated_at
json.status :success
json.account_information do 
  json.id  account_information.id
  json.first_name account_information.name
  json.last_name account_information.last_name
  json.address1 account_information.address1
  json.address2 account_information.address2 
  json.zipcode account_information.zipcode
  json.dob account_information.dob
  json.user_id account_information.user_id
  end