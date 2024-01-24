class AddNoteToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :note, :string, true
  end
end
