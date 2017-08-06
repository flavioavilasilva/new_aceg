class CreateAges < ActiveRecord::Migration[5.0]
  def change
    create_table :ages do |t|
      t.string :scala
      t.string :age
      t.references :pet, foreign_key: true

      t.timestamps
    end
  end
end
