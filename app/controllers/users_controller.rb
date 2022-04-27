class UsersController < ApplicationController
  
  before_action :set_q, only: %i(index search)
  
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
     @user = User.find_by(id: params[:id])
    if @user.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    end
  end
  
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
