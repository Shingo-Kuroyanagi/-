class BooksController < ApplicationController


  def create
    @book = Book.new(book_params)
   if @book.save  
    redirect_to book_path(@book.id)
   else
     @books = Book.all
     render 'index'
   end
  end
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end
  
  

private
  def book_params
    params.require(:book).permit(:title, :image, :body)
  end


end
