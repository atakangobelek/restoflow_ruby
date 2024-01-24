# app/grids/order_grid.rb
class OrdersGrid
    include Datagrid
  
    scope do
      Order
    end
  
    filter(:table, :string)
    filter(:state, :enum, select: Order.aasm.states.map(&:name))
    filter(:created_at, :date, range: true)
    filter(:note, :string)
  
    column(:table)
    column(:state)
    column(:created_at)
    column(:note)
    #i18n gelecek

end
  