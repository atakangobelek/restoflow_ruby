class ChangeAccountNullInOrderProducts < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:order_products, :account_id, true)
  end
end
