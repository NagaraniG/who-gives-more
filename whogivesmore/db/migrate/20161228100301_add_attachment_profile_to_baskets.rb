class AddAttachmentProfileToBaskets < ActiveRecord::Migration
  def self.up
    change_table :baskets do |t|
      t.attachment :profile
    end
  end

  def self.down
    remove_attachment :baskets, :profile
  end
end
