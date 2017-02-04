class CreateUserCompetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :user_competitions do |t|
      t.belongs_to :user, index: true
      t.belongs_to :competition, index: true
      t.timestamps
    end
  end
end
