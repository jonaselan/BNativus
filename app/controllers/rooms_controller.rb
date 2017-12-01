class RoomsController < ApplicationController
  before_action :set_room, only: %i[edit update destroy]
  before_action :set_languages, only: %i[new edit create index]
  before_action :authenticate_user!

  def index
    @rooms = Room.includes(:language, :user).all
    @rooms = @rooms.where('language_id = ?', params[:language]) unless params[:language].blank?
    @rooms = @rooms.where('level = ?', params[:level]) unless params[:level].blank?
  end

  def new
    @room = Room.new
  end

  def edit
    authorize! :edit, @room
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    @room.ip = request.remote_ip

    if @room.save
      redirect_to user_path(current_user), notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      redirect_to user_path(current_user), notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @room
    @room.destroy
    redirect_to user_path(current_user), notice: t('.notice')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(:link, :level, :language_id)
  end
end
