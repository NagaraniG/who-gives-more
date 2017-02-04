# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




competition_list=["religion","country","state","politics"]

competition_list.each do |name|
  Competition.create(name: name)
end

ranking_type=[
"raw total","per capita","per member"]

ranking_type.each do |ranking_type|
  Competition.create(ranking_type: ranking_type)
end

