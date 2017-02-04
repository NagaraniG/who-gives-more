class CreateAccountInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :account_informations do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.integer :zipcode
      t.date :dob
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
