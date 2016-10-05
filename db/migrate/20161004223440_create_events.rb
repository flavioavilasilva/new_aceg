class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.datetime :datetime
      t.references :ong, foreign_key: true

      t.timestamps
    end
  end
end
