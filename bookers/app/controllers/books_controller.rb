class BooksController < ApplicationController
	def new
		@book = Book.new
    end
    def create
    	@book = Book.new(book_params)
        blog.save
        redirect_to blogs_path
    end
    def index
    	@books = Book.all
    	@book = Book.new
    end
    def show
    end

    private

    def book_params
        params.require(:book).permit(:title, :body, :user_id)
    end
end
