class CreatePictures < ActiveRecord::Migration[5.0]
  def up
    create_table :pictures do |t|
      t.string :name
      t.references :imageable, :polymorphic => true
      t.timestamps
    end
  end
  def down 
     drop_table :pictures 
  end
end
