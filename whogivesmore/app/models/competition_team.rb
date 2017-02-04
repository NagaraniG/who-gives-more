class CompetitionTeam < ApplicationRecord
  belongs_to :competition
  belongs_to :team
  #accepts_nested_attributes_for :competition

end
