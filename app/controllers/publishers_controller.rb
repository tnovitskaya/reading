class PublishersController < ApplicationController

  load_and_authorize_resource param_method: :publisher_params
  before_action :find_publisher, only: [:show, :edit, :update, :destroy]

  def index
    @q = Publisher.ransack(params[:q])
    @publishers = @q.result.paginate(:page => params[:page], :per_page => 3)
  end

  def show
  end

  def new
     @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      redirect_to publishers_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @publisher.update_attributes(publisher_params)
      redirect_to publishers_path
    else
      render 'edit'
    end
  end

  def destroy
    @publisher.destroy
    redirect_to publishers_url
  end

  private

    def publisher_params
      params.require(:publisher).permit(:name, :location)
    end

    def find_publisher
      @publisher = Publisher.find(params[:id])
    end

end