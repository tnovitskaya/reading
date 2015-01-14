class WelcomeController < ApplicationController
  def index
    @books = Book.limit(10).includes(:authors).order(created_at: :desc)
    @interests = Interest.limit(10).includes(:user, :book).order(created_at: :desc)
    @comments = Comment.limit(10).includes(:user).order(created_at: :desc)
  end
end
