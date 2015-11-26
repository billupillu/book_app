class AuthorsController < ApplicationController
  def index
    @authors = Author.recent
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "Author has been successfully created"
      redirect_to @author
    else
      flash[:danger] = "Author has not been created"
      render :new
    end
  end


  private

    def author_params
      params.require(:author).permit(:first_name, :second_name)
    end
end
