class BooksController < ApplicationController
  

  def create
      @book = Book.new(book_params)
      @books.user_id = current_user.id
      @book.save  
      redirect_to book_path(@book.id)
  end
  
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show  
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
     @user = User.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to user_path(@user)
  end
  
  def destory
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end

private
  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
end
