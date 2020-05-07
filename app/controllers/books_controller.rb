class BooksController < ApplicationController
	before_action :authenticate_user!
	def top
	end

	# books
	def index
		@books = Book.all
		@user = current_user
    @post_book = Book.new
	end

	def new
		@post_book = Book.new
	end

	def edit
		@post_book = Book.find(params[:id])
		if @post_book.user.id != current_user.id
			redirect_to books_path
		end
	end

	def update
		@post_book = Book.find(params[:id])
		if @post_book.update(post_book_params)
			flash[:notice] = 'You have updated book successfully.'
			redirect_to book_path(@post_book.id)
		else
			render action: :edit
		end
	end

	def create
		@post_book = Book.new(post_book_params)
		@post_book.user_id = current_user.id
		@user = current_user
		if @post_book.save
			flash[:notice] = 'You have saved book successfully.'
			@book = @post_book
		  render action: :show
		else
			@books = Book.all
			render action: :index
		end
	end

	def show
    @post_book = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)
	end

	def destroy
		@book = Book.find(params[:id])
		if @book.user.id != current_user.id
			redirect_to books_path
		elsif @book.destroy
  		flash[:notice] = 'You have destroy book successfully.'
			redirect_to books_path
		end
	end

	private
	def post_book_params
		params.require(:book).permit(:title, :body, :user_id)
	end
end
