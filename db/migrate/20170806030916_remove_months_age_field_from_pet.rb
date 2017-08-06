class RemoveMonthsAgeFieldFromPet < ActiveRecord::Migration[5.0]
  def change
    remove_column :pets, :months_age, :string
  end
end
