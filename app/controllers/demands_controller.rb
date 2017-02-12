class DemandsController < ApplicationController
   def new
    @demand = Demand.new
  end
  
  def create
    @demand = Demand.create(demand_params)
    redirect_to @demand
  end
  
  def index
    @demands = Demand.all
  end
  
  def edit
    @demand = Demand.find(params[:id])
  end
  
  def update
    @demand = Demand.find(params[:id])
    if @demand.update(demand_params)
      
      flash[:notice] = "포스팅 수정이 완료되었습니다."
      redirect_to demand_path(@demand)
    else
      render 'edit'
    end
  end
  
  
  def show
    @demand = Demand.find(params[:id])
  end
  
  def demand_params
    params.require(:demand).permit(:gender, :start_date, :finish_date, :room_private, :price,:description)
  end
end
