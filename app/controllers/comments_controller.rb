class CommentsController < ApplicationController

  load_and_authorize_resource param_method: :comment_params
  before_action :find_comment, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,  only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
    if(params[:interest_id])
      @comment.interest = Interest.find(params[:interest_id])
    end
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to @comment.interest
    else
      render 'error'
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to @comment.interest
    else
      render 'edit'
    end
  end

  def destroy
    interest = @comment.interest
    @comment.destroy
    redirect_to interest
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :interest_id, :content)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_url if @comment.nil?
  end

end
