class CreateTeams < ActiveRecord::Migration[5.0]
  def up
    create_table :teams do |t|
     
      t.string :name
      t.text :description
      t.timestamps
    end
  end
  def down
    drop_table :teams
  end
end
