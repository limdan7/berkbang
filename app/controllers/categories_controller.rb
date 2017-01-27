class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new
    if @category.save
      flash[:success]="카테고리가 성공적으로 등록되었습니다."
      redirect_to categories_path
  end
  
  def show
  end
end