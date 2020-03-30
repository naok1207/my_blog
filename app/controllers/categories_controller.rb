class CategoriesController < ApplicationController
  def create
    unless Category.find_by(name: params[:category][:name])
      @category = Category.new(category_params)
      @category.save
    end
  end

  def destroy
    @category_id = params[:id]
    category = Category.find(params[:id])
    if category.posts.size < 2
      category.destroy
    end
  end

  def index
    @categories = Category.all
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
