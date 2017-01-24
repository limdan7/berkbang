class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update, :show, :destroy]
  
  def new
    @room = Room.new
  end
  
  def index
    @rooms = Room.all
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "방이 성공적으로 등록되었습니다."
      redirect_to room_path(@room)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def destroy
    @room.destroy
    flash[:notice] = "포스팅이 삭제되었습니다."
    redirect_to rooms_path
  end
    
  def update
    if @room.update(room_params)
      flash[:notice] = "포스팅 수정이 완료되었습니다."
      redirect_to room_path(@room)
    else
      render 'edit'
    end
  end
  
  private
    def set_room
      @room = Room.find(params[:id])
    end
    
    def room_params
      params.require(:room).permit(:address, :description)
    end
end