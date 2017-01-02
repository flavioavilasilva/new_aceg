class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :ong, foreign_key: true
      t.references :user, foreign_key: true
      t.string :zipcode
      t.string :lat
      t.string :long
      t.string :state
      t.string :city
      t.string :address
      t.string :address_number

      t.timestamps
    end
  end
end
