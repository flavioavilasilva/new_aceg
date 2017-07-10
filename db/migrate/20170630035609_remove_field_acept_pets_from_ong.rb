class RemoveFieldAceptPetsFromOng < ActiveRecord::Migration[5.0]
  def change
    remove_column :ongs, :acept_pets, :boolean
  end
end
