class RemoveStatusFromAdoption < ActiveRecord::Migration[5.0]
  def change
    remove_column :adoptions, :status, :string
  end
end
