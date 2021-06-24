class BooksController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = policy_scope(Book)
    @search = params["search"]
    if @search.present?
      @title = @search["title"]
      @books = Book.where("title ILIKE ?","%# {params[:search]}%")
    else
      @books = Book.all
    end
  end

  def new
    @book = Book.new
    authorize @book
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    authorize @book

    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def show
    authorize @book
  end

  def edit
    authorize @book
  end

  def update
    @book.update(book_params)
    redirect_to book_path(@book)
    authorize @book
  end

  def destroy
    @book.destroy
    redirect_to books_path
    authorize @book
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :availability, :photo)
  end
end
