class UsersController < ApplicationController
  def new
  end  
  
  def create
   
  end 
  
  def index
    @user = User.new
    @users = User.all
  end 
  
  def edit
  
  end 
  
  def show
    @user = User.find(params[:id])
  end
end
