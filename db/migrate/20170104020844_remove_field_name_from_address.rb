class RemoveFieldNameFromAddress < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :state, :string
    remove_column :addresses, :city, :string
    remove_column :addresses, :street, :string
    remove_column :addresses, :zipcode, :string
    remove_column :addresses, :neighborhood, :string
    remove_column :addresses, :number, :string
  end
end
