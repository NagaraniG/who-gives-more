 json.status :success
json.basket do 
  json.id basket.id
  json.name basket.name
  json.custom basket.custom
  json.percentage basket.percentage
  json.picture basket.picture.reload
  json.users basket.users.reload 
  end
