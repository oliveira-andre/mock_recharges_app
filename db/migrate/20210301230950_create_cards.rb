class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :bin
      t.string :last_digits
      t.string :token
      t.integer :status, default: 0
      t.references :customer

      t.timestamps
    end
  end
end
