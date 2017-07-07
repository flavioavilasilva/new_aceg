class AddPetCapacityToOng < ActiveRecord::Migration[5.0]
  def change
    add_column :ongs, :pet_capacity, :string
  end
end
