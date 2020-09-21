class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show  
    @book = Book.find_by(id:params[:id])
    @books = Book.all
    @user = User.find_by(id:params[:id])
  end  
  
  def create
      @user = current_user
      @book = Book.new(book_params)
      if @book.save  
       redirect_to book_path(@book.id), notice:"You have created book succesfully"
      else
       @books=Book.all
       render'index'
      end
  end
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to user_path(current_user)
  end
  
  def destory
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path,notice: "Book was succesfully destorted"
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
