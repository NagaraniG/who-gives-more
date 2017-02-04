class CreateDonations < ActiveRecord::Migration[5.0]
  def up
    create_table :donations do |t|
      t.string :firstname_on_card
      t.string :lastname_on_card
      t.integer :card_number ,:limit => 8
      t.date :expiration_date
      t.integer :cvv
      t.text :billing_address
      t.integer :amount
      t.belongs_to :user, index: true
      t.belongs_to :team, index: true
      t.timestamps
    end
  end
  def down
    drop_table :donations
  end
end
