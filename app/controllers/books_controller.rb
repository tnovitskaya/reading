class BooksController < ApplicationController

  load_and_authorize_resource :Book, through: :interests
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result.paginate(:page => params[:page], :per_page => 2)
  end

  def new
    @book = Book.new
  end

  def create
    data = params.require(:book).permit(:name, :genre, :publisher_id, :page_count, :author_ids)
    @book = current_user.books.new(data)
    if @book.save
      params[:book][:author_ids].each do |id|
        BookAndAuthorLink.create({book: @book, author: Author.find(id), role: :author}) if id.to_i > 0
      end
      redirect_to books_path
    else
      render :new
    end
  end

  def update
    data = params.require(:book).permit(:name, :genre, :publisher_id, :page_count, :author_ids)
    if @book.update(data)
      @book.book_and_author_links.delete_all
      params[:book][:author_ids].each do |id|
        BookAndAuthorLink.create({book: @book, author: Author.find(id), role: :author}) if id.to_i > 0
      end
      redirect_to books_path
    else
      render :edit
    end
  end

  def edit
  end

  def show
    @timeline = @book.interests
    .select do |i|
      i.start_reading && i.finish_reading
    end
    .map do |i|
      username = i.user.short_name
      from = i.start_reading.to_s
      to = i.finish_reading.to_s
      [username, from, to]
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

end
