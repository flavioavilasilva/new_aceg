class RemoveFieldNameFromTableAddress < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :lat, :string
    remove_column :addresses, :long, :string
  end
end
