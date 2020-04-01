class PostsController < ApplicationController
  layout 'basic', only: [:index, :show]
  before_action :check_ip, only: [:show, :index]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10).order(:created_at => :desc)
  end

  def show
    @post = Post.find(params[:id])
    add_count @post if check_access(@post.id)
    log_access(@post.id)
    @comments = @post.comments
    @comment = @post.comments.build # こいつのせいでからのコメントが表示される
  end

  def new
    @post = Post.new
    @category = Category.new
    @categories = []
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
    @category = Category.new
    @categories = @post.categories
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
  end

  def order
    how = params[:how].to_sym
    direction = params[:order].to_sym
    @posts = Post.paginate(page: params[:page], per_page: 10).order(how => direction)
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, category_ids: [])
    end

    def add_count(post)
      post.update_attributes(access_counter: post.access_counter + 1)
    end
end
