class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :company, null: false, foreign_key: true
      t.integer :user_id
      t.string :table, null: false
      t.string :state

      t.timestamps
    end
  end
end
