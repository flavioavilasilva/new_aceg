class AddStateToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :state, :string
  end
end
