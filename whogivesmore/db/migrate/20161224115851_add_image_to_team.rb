class AddImageToTeam < ActiveRecord::Migration[5.0]
  def up
    add_column :teams, :image, :string
  end
  def down
    remove_column :teams ,:image,:string
  end
end
