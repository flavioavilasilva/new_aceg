class DropOngAddress < ActiveRecord::Migration[5.0]
  def change
    drop_table :ong_addresses
  end
end
