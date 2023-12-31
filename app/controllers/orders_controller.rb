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

  def edit
    @company = Company.find(params[:company_id])
    @order = @company.orders.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    
    @order = @company.orders.find(params[:id])
    
    if @order.update(order_params)
      
    else
      hata mesaji
    end
  end
  

  private
  def order_params
    params.require(:order).permit(:table, :user_id)
  end
end
