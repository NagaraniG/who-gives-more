class SampleNameChangeColumnType < ActiveRecord::Migration[5.0]
  def change
     change_column(:donations, :amount, :float)
  end
end
