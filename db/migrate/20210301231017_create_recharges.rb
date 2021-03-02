class CreateRecharges < ActiveRecord::Migration[6.1]
  def change
    create_table :recharges do |t|
      t.references :customer
      t.references :card
      t.integer :amount
      t.string :token

      t.timestamps
    end
  end
end
