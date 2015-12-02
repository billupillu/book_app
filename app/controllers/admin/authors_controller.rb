class Admin::AuthorsController < Admin::BaseController
  before_action :require_signin
  before_action :require_admin
  before_action :find_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.recent
  end

  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "Author has been successfully created"
      redirect_to [:admin, @author]
    else
      flash[:danger] = "Author has not been created"
      render :new
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      flash[:success] = "Author has been successfuly Updated"
      redirect_to [:admin, @author]
    else
      flash[:danger] = "Author has not been Updated"
      render :edit
    end
  end

  def destroy
    @author.destroy
    flash[:success] = "Author has been successfuly Deleted"
    redirect_to admin_authors_path
  end

  private

    def find_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:first_name, :second_name)
    end
end
