class CreateInformationBanks < ActiveRecord::Migration[5.0]
  def change
    create_table :information_banks do |t|
      t.references :ong, foreign_key: true
      t.string :cnpj
      t.string :bank
      t.string :agency
      t.string :account_number

      t.timestamps
    end
  end
end
