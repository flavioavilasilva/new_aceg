class AddNeighborhoodToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :neighborhood, :string
  end
end
