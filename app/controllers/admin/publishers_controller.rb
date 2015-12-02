class Admin::AuthorsController < Admin::BaseController
  before_action :require_signin
  before_action :require_admin
  before_action :find_publisher, only: [:show, :edit, :update, :destroy]

  def index
    @publishers = Publisher.recent
  end

  def show
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:success] = "Publisher has been successfully created"
      redirect_to [:admin, @publisher]
    else
      flash[:danger] = "Publisher has not been created"
      render :new
    end
  end

  def edit
  end

  def update
    if @publisher.update(publisher_params)
      flash[:success] = "Publisher has been successfuly Updated"
      redirect_to [:admin, @publisher]
    else
      flash[:danger] = "Publisher has not been Updated"
      render :edit
    end
  end

  def destroy
    @publisher.destroy
    flash[:success] = "Publisher has been successfuly Deleted"
    redirect_to admin_publishers_path
  end

  private

    def find_publisher
      @publisher = Publisher.find(params[:id])
    end

    def publisher_params
      params.require(:publisher).permit(:name)
    end
end
