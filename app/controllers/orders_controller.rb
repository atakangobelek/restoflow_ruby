class OrdersController < ApplicationController

  def index
    @orders = Order.list(current_user.company_id)
  end

  def new
    @order = Order.new
  end

  def create
    @company = Company.find(params[:company_id])

    @order = @company.orders.build(order_params) # Order company id ile init oluyor
    if @order.save
      @order.user = current_user if current_user.present?
      @order.save
    else
      hata mesaji
    end
  end

  private
  def order_params
    params.require(:order).permit(:table)
  end
end
