class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :size
      t.string :pet_type
      t.string :breed
      t.string :gender
      t.boolean :vaccined
      t.text :deficiency
      t.boolean :castrated
      t.text :description

      t.timestamps
    end
  end
end
