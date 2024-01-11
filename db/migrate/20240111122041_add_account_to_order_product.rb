class AddAccountToOrderProduct < ActiveRecord::Migration[7.1]
  def change
    add_reference :order_products, :account, null: false, foreign_key: true
  end
end
