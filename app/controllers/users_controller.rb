class UsersController < ApplicationController
  before_action :set_user, only: [:edit,:update,:show]
  before_action :authenticate_user, only: [:edit,:update,:show,:index, :favorites]
  before_action :forbid_login_user, only: [:new,:create]
  before_action :ensure_login_user, only: [:edit,:update]

  def index
    @users = User.all
  end

  def edit
  end

  def new
   @user = User.new
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: 'ユーザプロフィールが編集されました'
    else
      render "edit"
    end
  end

  def create
   @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
     else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end


  def favorites
    @user = User.find_by(id: params[:id])
    @favorites = Favorite.where(user_id: @user.id)
  end


  private

  def set_user
     @user = User.find(params[:id])
  end

  def ensure_login_user
    if current_user.id != params[:id].to_i
      redirect_to pictures_path, notice: "権限がありません"
    end
  end

  def user_params
     params.require(:user).permit(:name,:email,:password,:password_confirmation,:user_image,:user_image_cache)
  end

end
