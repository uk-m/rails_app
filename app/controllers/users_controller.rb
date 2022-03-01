class UsersController < ApplicationController
  
  before_action :set_q, only: [:index, :search]

  def index
    @users = User.page(params[:page]).per(12)
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.page(params[:page])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "削除しました"
    redirect_to root_path
  end
  
  def following
    @title = "フォロー中"
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page])
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render 'show_follow'
  end
  
  def search
    @users = @q.result
  end
  
  private
  
    def set_q
      @q = User.ransack(params[:q])
    end
end
