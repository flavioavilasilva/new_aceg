class RemoveGenreFromPets < ActiveRecord::Migration[5.0]
  def change
    remove_column :pets, :genre, :string
  end
end
