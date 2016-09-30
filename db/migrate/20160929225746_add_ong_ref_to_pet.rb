class AddOngRefToPet < ActiveRecord::Migration[5.0]
  def change
    add_reference :pets, :ong, foreign_key: true
  end
end
