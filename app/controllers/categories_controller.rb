class CategoriesController < ApplicationController

    def index
        @categories = Category.list(current_user.company_id)
    end

    def new
        @category = Category.new
    end

    def create
        @company = Company.find(params[:company_id])

        @category = @company.categories.build(category_params)

        @category.save
    end


    private
    def category_params
        params.require(:category).permit(:name)
    end

end
