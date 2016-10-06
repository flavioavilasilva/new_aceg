class AddUserRefToOng < ActiveRecord::Migration[5.0]
  def change
    add_reference :ongs, :user, foreign_key: true
  end
end
