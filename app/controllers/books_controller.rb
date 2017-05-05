class BooksController < ApplicationController
  def index
    @books=Book.all
  end
  
  def show
    find_book
  end
  
  def edit
    find_book
  end
  
  def new
    @book=Book.new
  end
  
  def create
    @book=Book.new(clean_data)
    if @book.save
      redirect_to books_path, notice: "新增成功!"      
    else
      redirect 'new'
    end
  end
  
  def update
    find_book    
    if @book.update(clean_data)
      redirect_to books_path, notice: "更新成功!"
    else
      redirect 'edit'
    end
  end
  
  private
    def clean_data
      params.require("book").permit(:name, :intro, :author, :price)
    end
  end
  
  def find_book
    @book=Book.find_by(id: params[:id])
    if @book.nil?
      redirect_to books_path
    end
  end