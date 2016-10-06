class UsersController < ApplicationController
  before_action :correct_user, only:[:edit,:update]
  before_action :set_user, only:[:show,:update,:edit]


  def new
    @user = User.new
  end

  def show # 追加
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:info] = "logged in as #{@user.name}"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end

  def update
   if @user.update(user_params)
     redirect_to @user
    else
      render 'edit'
   end
  end

 def edit
   @user = User.find(params[:id])
 end


 private

 def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :region, :profile)
 end
 
 def set_user
   @user = User.find(params[:id])
 end

 def correct_user
  user = User.find(params[:id])
  if current_user.id != user.id
  redirect_to root_path
  else
  end
 end
  
 end