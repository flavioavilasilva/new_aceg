class AddPostalCodeToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :postal_code, :string
  end
end
