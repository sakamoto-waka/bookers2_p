class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book)
    else
      render "users/index"
    end  
  end  

  def new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
