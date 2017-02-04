class CreateCompetitionTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :competition_teams do |t|
       t.belongs_to :competition, index: true
      t.belongs_to :team, index: true
      t.timestamps
    end
  end
  def down
  drop_table :competition_teams
  end

end
