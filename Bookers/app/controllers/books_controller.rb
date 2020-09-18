class BooksController < ApplicationController
  

  def create
      @book = Book.new(book_params)
      @books.user_id = current_user.id
   if @book.save  
    redirect_to book_path(@book.id)
   else
     @books = Book.all
     render 'index'
   end
  end
  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @book = @user.books
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def upsate
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to user_url(current_user_id)
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
