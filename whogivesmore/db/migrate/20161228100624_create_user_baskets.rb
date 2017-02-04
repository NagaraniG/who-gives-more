class CreateUserBaskets < ActiveRecord::Migration[5.0]
  def up
    create_table :user_baskets do |t|
       t.belongs_to :user, index: true
      t.belongs_to :basket, index: true
      t.timestamps
    end
  end
  def down
    drop_table :user_baskets
  end
end
