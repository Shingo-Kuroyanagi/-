class UsersController < ApplicationController
  
  def index
    @user =  current_user
    @users = User.all
  end 
  
  def edit
    @user = User.find(params[:id])
  end 
  
  def show
    @user = User.find(params[:id])
    @user = current_user
    @book=Book.new
    @books=Book.all
  end
  
  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to user_path(@user)
  end
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image_id)
  end
end
