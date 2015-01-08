class BooksController < ApplicationController

	before_action :find_book, only: [:show, :edit, :update, :destroy]

	def index
		@books = Book.paginate(:page => params[:page], :per_page => 2)
	end

	def new
		@book = Book.new
		@method = "new"
		render "new-edit-form"
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
		@method = "edit"
		render "new-edit-form"
	end

	def show
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
