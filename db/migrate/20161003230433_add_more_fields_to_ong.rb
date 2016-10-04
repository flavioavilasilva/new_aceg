class AddMoreFieldsToOng < ActiveRecord::Migration[5.0]
  def change
    add_column :ongs, :street, :string
    add_column :ongs, :zipcode, :string
    add_column :ongs, :neighborhood, :string
    add_column :ongs, :number, :string
  end
end
