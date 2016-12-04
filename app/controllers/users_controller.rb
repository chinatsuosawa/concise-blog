class UsersController < ApplicationController
  before_action :set_params, only: [:followings, :followers, :favorites]

  def new
    # インスタンス生成
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  # フォロー一覧取得
  def followings
    @title = "Follow users"
    followings = @user.following_users
    @count = followings.count
    @users = followings.page(params[:page])
    render 'show_follow'
  end

  # フォロワー一覧取得
  def followers
    @title = "Followers"
    followers = @user.follower_users
    @count = followers.count
    @users = followers.page(params[:page])
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :uid)
  end

  # ユーザー情報取得
  def set_params
    @user = User.find(params[:id])
  end
end
