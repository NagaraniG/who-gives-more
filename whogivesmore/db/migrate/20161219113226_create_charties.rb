class CreateCharties < ActiveRecord::Migration[5.0]
  def change
    create_table :charties do |t|
      t.string :name
      t.attachment :pic
      t.boolean :custom
      t.decimal :percentage
      t.timestamps
    end
  end
end
