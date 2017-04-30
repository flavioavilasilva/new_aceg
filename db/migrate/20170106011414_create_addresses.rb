class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.string :latitude
      t.string :longitude
      t.string :state
      t.string :city
      t.string :address
      t.string :address_number
      t.float  :latitude
      t.float  :longitude

      t.timestamps
    end
  end
end
