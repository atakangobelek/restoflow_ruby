class ProductsController < ApplicationController

    def index
        @products = Product.list(current_user.company_id)
    end

    def new
        @product = Product.new
        @categories = Category.list(current_user.company_id)
    end

    def create
        @company = Company.find(params[:company_id])

        @product = @company.products.build(product_params)

        @product.save

    end



    private
    def product_params
        params.require(:product).permit(:name, :price, :category_id)
    end


end
