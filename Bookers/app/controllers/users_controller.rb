class UsersController < ApplicationController
  def new
  end  
  
  def create
   
  end 
  
  def index
    @user =  current_user
    @users = User.all
    @books=Book.all
  end 
  
  def edit
    @user = User.find(params[:id])
  end 
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books=Book.all
  end
  
  def upsate
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to user_path(@user.id)
  end
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profilw_image_id)
  end
end
