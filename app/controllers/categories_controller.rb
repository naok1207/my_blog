class CategoriesController < ApplicationController
  layout 'basic', only: [:index, :show]

  def create
    if @category = Category.find_by(name: params[:category][:name])
    else
      @category = Category.new(category_params)
      @category.save
    end
  end

  def destroy
    @category_id = params[:id]
    category = Category.find(params[:id])
    if category.posts.empty?
      category.destroy
    end
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.paginate(page: params[:page], per_page: 10)
  end

  def order
    how = params[:how].to_sym
    direction = params[:order].to_sym
    category = Category.find(params[:id])
    @posts = category.posts.paginate(page: params[:page], per_page: 10).order(how => direction)
  end

  def serch
    serch_text = params[:serch_text]
    @categories = Category.search(serch_text).paginate(page: params[:page], per_page: 10)
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
