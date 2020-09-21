class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show  
    @book = Book.find(params[:id])
    @books = Book.all
  end  
  
  def create
      book = Book.new(book_params)
      book.save  
      redirect_to book_path(book.id), notice:"You have created book succesfully"
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
    redirect_to books_path
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
