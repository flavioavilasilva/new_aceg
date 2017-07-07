class AddAvailableFieldToPet < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :available, :boolean, default: true
  end
end
