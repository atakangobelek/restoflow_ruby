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

  def edit
    @company = Company.find(params[:company_id])
    @category = @company.categories.find(params[:id])
    @categories = Category.list(current_user.company_id)
  end

  def update
    @company = Company.find(params[:company_id])
    @category = @company.categories.find(params[:id])
    if @category.update(category_params)
        
    else
        Hata
    end
  end


  private
  def category_params
    params.require(:category).permit(:name)
  end

end
