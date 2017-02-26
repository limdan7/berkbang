class DemandsController < ApplicationController
  before_action :set_demand, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def new
    @demand = Demand.new
  end
  
  def create
    @demand = Demand.new(demand_params)
    @demand.user_id = current_user.id
    
    if (User.find(@demand.user_id).demands.count >= 2)
      flash[:danger] = "포스팅을 두 개 이상 등록하지 못합니다."
      render 'new'
    else
      if @demand.save
        flash[:notice] = "포스트가 성공적으로 등록되었습니다."
        redirect_to demand_path(@demand)
      else
        render 'new'
      end
    end
  end
  
  def index
    @demands = Demand.all
  end
  
  def edit
  end
  
  def update
    if @demand.update(demand_params)
      
      flash[:notice] = "포스팅 수정이 완료되었습니다."
      redirect_to demand_path(@demand)
    else
      render 'edit'
    end
  end
  
  
  def show
  end
  
  def destroy
    @demand.destroy
    flash[:notice] = "포스팅이 삭제되었습니다."
    redirect_to rooms_path
  end
  
  private 

  def set_demand
    @demand = Demand.find(params[:id])
  end
  
  def demand_params
    params.require(:demand).permit(:gender, :start_date, :finish_date, :room_private, :price,:description)
  end
  
  def require_same_user
    if current_user.id != @demand.user_id and !current_user.admin?
      flash[:danger] = "자신이 작성한 글만 수정/삭제 가능합니다."
      redirect_to root_path
    end
  end
end
