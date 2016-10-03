class AddFieldsToOng < ActiveRecord::Migration[5.0]
  def change
    add_column :ongs, :cnpj, :string
    add_column :ongs, :address, :string
    add_column :ongs, :email, :string
    add_column :ongs, :contact, :string
    add_column :ongs, :about_us, :text
    add_column :ongs, :logo, :string
    add_column :ongs, :acept_pets, :boolean
  end
end
