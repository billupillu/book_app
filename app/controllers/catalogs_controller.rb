class CatalogsController < ApplicationController
  def index
  	@books = Book.all
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
