class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create    
    if params[:isHardcover] == nil
     params[:isHardcover] = false
    end
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book created!"
      redirect_to create_ad_path
    else
      redirect_to new_book_path
    end
  end
  
  def destroy
    @book.destroy
    flash[:success] = "Ad deleted"
    redirect_to request.referrer || 'static_pages/home'
  end
  
  def show
    @book = Book.find(params[:book])
   end
  
  private

    def book_params
      params.require(:book).permit(:title, :num_of_pages, :edition, :isHardcover)
    end
  
end
