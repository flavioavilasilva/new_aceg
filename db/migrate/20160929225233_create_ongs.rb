class CreateOngs < ActiveRecord::Migration[5.0]
  def change
    create_table :ongs do |t|
      t.string :name
      t.string :location
      t.string :phone
      t.string :mail
      t.string :site
      t.string :pets

      t.timestamps
    end
  end
end
