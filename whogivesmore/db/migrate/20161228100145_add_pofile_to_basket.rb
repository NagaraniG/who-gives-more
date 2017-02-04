class AddPofileToBasket < ActiveRecord::Migration[5.0]
  def change
    add_column :baskets, :profile, :string
  end
end
