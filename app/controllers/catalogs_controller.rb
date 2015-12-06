class CatalogsController < ApplicationController
  def index
  	@books = Book.paginate(page: params[:page], per_page: 6)
  	set_cart if session[:cart_id]
  end

  def show
  	@book = Book.find(params[:id])
  	set_cart if session[:cart_id]
  end

  def search
  	@books = Book.search_by_title(params[:search_word])
  end
end
