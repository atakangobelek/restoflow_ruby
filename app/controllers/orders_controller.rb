class OrdersController < ApplicationController

  def index
    @orders = Order.list(current_user.company_id)
  end

  def new
    @order = Order.new
    @order.order_products.build   #viewmdan gelen sembol :order_products burada order icerisine build ediliyor, sonra model icerisindeki -> through: :order_products methoduyla order_products modeline yaziliyor
                                  #Build order icerisinde bir order_products objesi olusturmaya yarar
    @products = Product.list(current_user.company)
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

  def close_edit
    @order = Order.find(params[:id])
  end

  def close_order_update
    @order = Order.find(params[:id])
    if @order.cancel!
      @order.update(order_params)
    else
    end
  end
  

  private
  def order_params
    params.require(:order).permit(:table, :user_id, :note, order_products_attributes: [:id, :_destroy, :product_id])
  end
end
