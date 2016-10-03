class RemoveFieldsFromOng < ActiveRecord::Migration[5.0]
  def change
    remove_column :ongs, :location, :string
    remove_column :ongs, :mail, :string
  end
end
