class RemovePetsFromOng < ActiveRecord::Migration[5.0]
  def change
    remove_column :ongs, :pets, :string
  end
end
