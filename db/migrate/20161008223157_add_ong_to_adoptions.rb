class AddOngToAdoptions < ActiveRecord::Migration[5.0]
  def change
    add_reference :adoptions, :ong, foreign_key: true
  end
end
