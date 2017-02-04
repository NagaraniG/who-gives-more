class RenameColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :pictures, :name, :avatar
  end
end
