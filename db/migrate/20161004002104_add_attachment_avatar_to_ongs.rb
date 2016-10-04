class AddAttachmentAvatarToOngs < ActiveRecord::Migration
  def self.up
    change_table :ongs do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :ongs, :avatar
  end
end
