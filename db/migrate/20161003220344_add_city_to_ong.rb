class AddCityToOng < ActiveRecord::Migration[5.0]
  def change
    add_column :ongs, :state, :string
    add_column :ongs, :city, :string
  end
end
