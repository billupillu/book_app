class Admin::BooksController < Admin::BaseController
  before_action :require_signin
  before_action :require_admin
 before_action :find_books, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.recent
  end

  def show
  end

  def new
    @book = Book.new
    @publishers = Publisher.all
    @authors = Author.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book has been created"
      redirect_to [:admin, @book]
    else
      flash[:danger] = "Book has not been created"
      @publishers = Publisher.all
      @authors = Author.all
      render :new
    end
  end

  def edit
    @publishers = Publisher.all
    @authors = Author.all
  end

  def update
    if @book.update(book_params)
      flash[:success] = "Book has been updated"
      redirect_to [:admin, @book]
    else
      flash[:danger] = "Book has not been updated"
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:success] = "Book has been deleted"
    redirect_to admin_books_path
  end

  private

    def find_books
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:book_cover,:title, :isbn, :description, :published_at, :publisher_id, :page_count, :price,author_ids: [])
    end
end
