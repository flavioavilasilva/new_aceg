class CreateAdoptions < ActiveRecord::Migration[5.0]
  def change
    create_table :adoptions do |t|
      t.references :pet, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
