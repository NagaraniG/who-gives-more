class CreateBaskets < ActiveRecord::Migration[5.0]
  def up
    create_table :baskets do |t|
      t.string :name
      t.boolean :custom
      t.decimal :percentage

      t.timestamps
    end
  end
  def down
    drop_table :baskets
  end
end
