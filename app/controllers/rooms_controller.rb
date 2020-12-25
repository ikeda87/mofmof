class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
    2.times { @room.stations.build }
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    form = @room.stations.count
    if form == 0
      2.times { @room.stations.build }
    elsif form == 1
      1.times { @room.stations.build }
    else
     form+1.times { @room.stations.build }
   end
  end

  def create
    @room = Room.new(room_params)
    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: '作成されました。' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      #if @room.update(room_params)
      if @room.update(update_room_params)
        format.html { redirect_to @room, notice: 'アップデートされました。' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: '削除されました。' }
    end
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :rent, :adress, :age, :note, stations_attributes:[:route_name, :station_name, :minutes])
    end

    def update_room_params
      params.require(:room).permit(:name, :rent, :adress, :age, :note, stations_attributes:[:route_name, :station_name, :minutes,:_destroy, :id])
    end
   end
