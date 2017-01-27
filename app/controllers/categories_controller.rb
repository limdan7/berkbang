class CategoriesController < ApplicationController
  before_action :require_admin, except:[:index, :show]
  
  def index
    @categories = Category.paginate(page: params[:page], per_page:5)
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success]="카테고리가 성공적으로 등록되었습니다."
      redirect_to categories_path
    else
      render 'new'
    end
  end
  
  def show
    @category = Category.find(params[:id])
    @category_rooms= @category.rooms.paginate(page: params[:page], per_page: 5)
  end
  
   def edit
      @category = Category.find(params[:id])
    end
    
    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        flash[:success]= "카테고리 제목이 업데이트 되었습니다."
        redirect_to category_path(@category)
      else
        render 'edit'
      end
    end
  private
    def category_params
      params.require(:category).permit(:name)
    end
    
    def require_admin
      if !user_signed_in? || (user_signed_in? and !current_user.admin?)
        flash[:danger] = "운영자만이 이 기능을 사용 할 수 있습니다"
        redirect_to categories_path
      end
    end
    
   
        
end