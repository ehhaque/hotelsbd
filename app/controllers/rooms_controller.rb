class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :load_hotel
  #before_filter :load_hotel

  # GET /rooms
  # GET /rooms.json
  def index
    #@rooms = @hotel.rooms.all
    @hotel_name = @hotel.name
    @rooms = @hotel.rooms.paginate(page: params[:page])
    
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    
  end

  # GET /rooms/new
  def new
    @room = @hotel.rooms.new
  end

  # GET /rooms/1/edit
  def edit
    
  end

  
  # POST /rooms
  # POST /rooms.json
  def create
    @room = @hotel.rooms.build(room_params)

    respond_to do |format|
      if @room.save
        #format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.html { redirect_to hotel_rooms_path, notice: 'Room was successfully created.' }
        format.json { render action: 'show', status: :created, location: @room }
      else
        format.html { render action: 'new' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    

    respond_to do |format|
      if @room.update_attributes(room_params)
        format.html { redirect_to [@hotel, @room], notice: 'Room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    
    @room.destroy
    respond_to do |format|
      format.html { redirect_to hotel_rooms_path(@hotel) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @hotel = Hotel.find(params[:hotel_id])
      @room = @hotel.rooms.find(params[:id])
      #@room = Room.find(params[:id])
      #@room = @hotel.Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:room_type, :bed_type, :num_beds, :price, :currency, :hotel_id)
    end

    def load_hotel
      @hotel = Hotel.find(params[:hotel_id])
    end
end
