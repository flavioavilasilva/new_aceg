class RemoveFieldAceptPetsFromOng < ActiveRecord::Migration[5.0]
  def change
    remove_column :ongs, :acept_pets, :boolean
    remove_column :ongs, :pet_capacity, :int
  end
end
