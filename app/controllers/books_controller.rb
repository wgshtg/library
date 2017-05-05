class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy] 
  def index
    @books=Book.all
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def new
    @book=Book.new
  end
  
  def create
    @book=Book.new(clean_data)
    if @book.save
      redirect_to books_path, notice: "新增成功!"      
    else
      render 'new'
    end
  end
  
  def update
        
    if @book.update(clean_data)
      redirect_to books_path, notice: "更新成功!"
    else
      render 'edit'
    end
  end
  
  def destroy
    
    @book.destroy
    redirect_to books_path, notice: "刪除成功!"
  end
  
  private
    def clean_data
      params.require("book").permit(:name, :intro, :author, :price)
    end
  end
  
  def find_book
    @book=Book.find_by(id: params[:id])
    if @book.nil?
      redirect_to books_path, notice: "沒有資料!"
    end
  end