class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book created!"
      redirect_to create_ad_path
    else
      redirect_to create_ad_path
    end
  end
  
  private

    def book_params
      params.require(:book).permit(:title, :num_of_pages, :edition, :isHardcover)
    end
  
end
