class BooksController < ApplicationController
  before_action :find_book, only: [:edit, :update, :destroy]

  def index
    @books = Book.all.order(title: :asc)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path, success: 'The book has been created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, success: 'The book has been updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, success: 'The book has been deleted.'
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:isbn, :title, :subtitle, :publisher_id, :release_date, :price, :edition, :pages, :abstract)
  end

end
