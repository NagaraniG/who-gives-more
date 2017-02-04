class CreateCompetitions < ActiveRecord::Migration[5.0]
  def up
    create_table :competitions do |t|
      t.string :name
      t.date :end_date
      t.string :ranking_type
      t.boolean :no_end_date
      t.timestamps
    end
  end

  def down
    drop_table :competitions
  end

end
