class AddTeamsToUsers < ActiveRecord::Migration[5.0]
  def up
  

    add_column :users, :team_items, :json,array:true
     add_column :users, :basket_items, :json,array:true


  end
  def down
    remove_column :users,:teamsitems
  end
end
