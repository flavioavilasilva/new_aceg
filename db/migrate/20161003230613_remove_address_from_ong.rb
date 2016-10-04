class RemoveAddressFromOng < ActiveRecord::Migration[5.0]
  def change
    remove_column :ongs, :address, :string
  end
end
