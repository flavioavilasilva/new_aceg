class RemoveAgeFromPet < ActiveRecord::Migration[5.0]
  def change
    remove_column :pets, :age, :int
  end
end
