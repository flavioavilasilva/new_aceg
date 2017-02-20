class DropUserAddress < ActiveRecord::Migration[5.0]
  def change
    drop_table :user_addresses
  end
end
