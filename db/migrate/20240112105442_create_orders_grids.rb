class CreateOrdersGrids < ActiveRecord::Migration[7.1]
  def change
    create_table :orders_grids do |t|

      t.timestamps
    end
  end
end
