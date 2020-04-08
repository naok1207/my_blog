class AdminController < ApplicationController
  include AdminHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to admin_path(id: 1)
    else
      render 'new'
    end
  end

  def show
    if admin?
      @posts = Post.all.order(access_counter: :desc)
    else
      render 'new' 
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
