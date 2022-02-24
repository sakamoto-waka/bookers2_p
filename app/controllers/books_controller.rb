class BooksController < ApplicationController
  def index
    @books = Book.includes(:user)
    @book = Book.new
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book), notice: 'You have created book successfully.'
    else
      @books = Book.includes(:user)
      @users = User.all
      render "users/index"
    end
  end

  def new
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
