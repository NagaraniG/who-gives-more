class Competition < ApplicationRecord
  
  has_many :user_competitions
  has_many :users, through: :user_competitions

  validates :name ,:presence => true,
                   :uniqueness => true

  has_many :competition_teams
  has_many :teams ,through: :competition_teams

end
