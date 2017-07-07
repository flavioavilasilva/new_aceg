class AddFacebookUrlToOng < ActiveRecord::Migration[5.0]
  def change
    add_column :ongs, :facebook_url, :string
  end
end
