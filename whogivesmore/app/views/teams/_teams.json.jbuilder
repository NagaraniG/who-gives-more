# json.extract! team, :id,:image,:name,:description ,:created_at, :updated_at
 json.status :success
json.team do 
  json.id  team.id
  json.name team.name
  json.description team.description
  json.picture team.picture
  json.competitions team.competitions.reload 
  json.donations team.donations.reload
  end
