class BooksController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authorize_book, except: [:index]


  def index
    @books = policy_scope(Book)
    if params[:search].present?
      @books = Book.where("title ILIKE ?", "%#{params[:search]}%")
    else
      @books = Book.all
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user

    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def authorize_book
    authorize @book
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :availability, :photo)
  end
end
