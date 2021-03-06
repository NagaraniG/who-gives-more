class AddAttachmentNameToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :pictures, :name
  end
end
