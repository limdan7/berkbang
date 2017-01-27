class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def new
    @room = Room.new
  end
  
  def index
    @rooms = Room.paginate(page: params[:page], per_page: 5)
  end
  
  def create
    @room = Room.new(room_params)
    @room.user = current_user
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
      params.require(:room).permit(:address, :description,category_ids: [])
    end
    
    def require_same_user
      if current_user != @room.user and !current_user.admin?
        flash[:danger] = "자신이 작성한 글만 수정/삭제 가능합니다."
        redirect_to root_path
      end
    end
    
end