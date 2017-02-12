class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @room = Room.find(params[:room_id])
    @request = @room.requests.create(request_params)
    @request.user_id = current_user.id
    if @request.save 
      flash[:success]="메세지를 보냈습니다."
      redirect_to :back
    else
      flash[:danger]="메세지를 보내는 데 실패했습니다."
      redirect_to :back
    end
  end
  
  private
  
  def request_params
    params.require(:request).permit(:description, :start_date, :finish_date)
 end
end
