class CreateUserCharties < ActiveRecord::Migration[5.0]
  def change
    create_table :user_charties do |t|
       t.belongs_to :user, index: true
      t.belongs_to :chartie, index: true
      t.timestamps
    end
  end
end
