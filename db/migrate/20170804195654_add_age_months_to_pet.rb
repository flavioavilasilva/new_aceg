class AddAgeMonthsToPet < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :months_age, :int
  end
end
