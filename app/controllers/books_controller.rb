class BooksController < ApplicationController
  def index
    
  end
  
  def new
    @book=Book.new
  end
  
  def create
    @book=Book.new(clean_data)
    if @book.save
      redirect_to books_path, notice: "新增成功!"      
    else
      redirect_to 'new'
    end
  end
  
  private
    def clean_data
      params.require("book").permit(:name, :intro, :author, :price)
    end
  end
