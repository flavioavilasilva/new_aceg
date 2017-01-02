class AddDescriptionToOngs < ActiveRecord::Migration[5.0]
  def change
    add_column :ongs, :description, :string
  end
end
