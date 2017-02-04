# json.extract! competition, :id,:name,:ranking_type,:end_date ,:no_end_date,:created_at, :updated_at
# json.url team_url(team, format: :json)

json.status :success
json.competition do 
  json.id competition.id
  json.name competition.name
  json.ranking_type competition.ranking_type
  json.end_date competition.end_date
  json.no_end_date competition.no_end_date
  json.teams competition.teams.reload 
  end


 