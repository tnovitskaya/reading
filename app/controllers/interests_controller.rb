class InterestsController < ApplicationController

  load_and_authorize_resource param_method: :interest_params
  before_action :find_interest, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,  only: [:edit, :update,:destroy]

  def show
  end

  def new
    @interest = Interest.new
    if(params[:book_id])
      @interest.book = Book.find(params[:book_id])
    end
  end

  def create
    @interest = current_user.interests.build(interest_params)
    if @interest.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @interest.update_attributes(interest_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    @interest.destroy
    redirect_to current_user
  end

  private

    def interest_params
      params.require(:interest).permit(:user_id, :book_id, :review, :start_reading, :finish_reading)
    end

    def find_interest
      @interest = Interest.find(params[:id])
    end

    def correct_user
      @interest = current_user.interests.find_by(id: params[:id])
      redirect_to root_url if @interest.nil?
    end

end
