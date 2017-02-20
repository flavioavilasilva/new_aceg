class AddAddressToOngs < ActiveRecord::Migration[5.0]
  def change
    add_reference :ongs, :address, foreign_key: true
  end
end
