class AddStatusToAdoption < ActiveRecord::Migration[5.0]
  def change
    add_column :adoptions, :status, :integer, default: 0
  end
end
