class CreateUserTeams < ActiveRecord::Migration[5.0]
  def up
    create_table :user_teams do |t|
      t.belongs_to :user, index: true
      t.belongs_to :team, index: true
      t.timestamps
    end
  end
  def down
    drop_table :user_teams
  end
end
