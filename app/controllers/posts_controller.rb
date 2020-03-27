class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 10).order(:created_at => :desc)
  end

  def show
    @post = Post.find(params[:id])
    add_count @post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def delete
  end

  def order
    how = params[:how].to_sym
    direction = params[:order].to_sym
    @posts = Post.paginate(page: params[:page], per_page: 10).order(how => direction)
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end

    def add_count(post)
      post.update_attributes(access_counter: post.access_counter + 1)
    end
end
