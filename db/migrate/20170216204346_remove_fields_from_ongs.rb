class RemoveFieldsFromOngs < ActiveRecord::Migration[5.0]
  def change
    remove_column :ongs, :state, :string
    remove_column :ongs, :city, :string
    remove_column :ongs, :street, :string
    remove_column :ongs, :zipcode, :string
    remove_column :ongs, :neighborhood, :string
    remove_column :ongs, :number, :string
  end
end
