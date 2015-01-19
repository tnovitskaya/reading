class AuthorsController < ApplicationController

  load_and_authorize_resource :Author
  before_action :find_author, only: [:show, :edit, :update, :destroy]

  def index
    @q = Author.ransack(params[:q])
    @authors = @q.result.paginate(:page => params[:page], :per_page => 2)
  end

  def new
    @author = Author.new
  end

  def create
    data = params.require(:author).permit(:first_name, :last_name)
    @author = Author.new(data)
    if @author.save
      redirect_to authors_path
    else
      render :new
    end
  end

  def update
    data = params.require(:author).permit(:first_name, :last_name)
    if @author.update(data)
      redirect_to authors_path
    else
      render :edit
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

  def find_author
    @author = Author.find(params[:id])
  end

end
