class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update, :destroy]
  before_action :set_languages, only: [:new, :edit]
  before_action :authenticate_user!

  def index
    @rooms = Room.all
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

    respond_to do |format|
      if @room.save
        format.html { redirect_to user_path(current_user), notice: 'Room was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to user_path(current_user), notice: 'Room was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize! :read, @room
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
    end
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
