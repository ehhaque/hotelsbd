class PaintingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_painting, only: [:show, :edit, :update, :destroy]


  # GET /paintings
  # GET /paintings.json
  def index
    @paintings = Painting.all
  end

  # GET /paintings/1
  # GET /paintings/1.json
  def show
  end

  # GET /paintings/new
  def new
    @painting = Painting.new(:room_id => params[:room_id])
  end

  # GET /paintings/1/edit
  def edit
  end

  # POST /paintings
  # POST /paintings.json
  def create
    @painting = Painting.new(painting_params)
    @room = @painting.room
    @hotel = @room.hotel

    respond_to do |format|
      if @painting.save
        format.html { redirect_to hotel_room_path(@hotel, @room), notice: 'Painting was successfully created.' }
        format.json { render action: 'show', status: :created, location: @painting }
      else
        format.html { render action: 'new' }
        format.json { render json: @painting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paintings/1
  # PATCH/PUT /paintings/1.json
  def update
    respond_to do |format|
      if @painting.update(painting_params)
        @room = @painting.room
        @hotel = @room.hotel
        format.html { redirect_to hotel_room_path(@hotel, @room), notice: 'Painting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @painting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paintings/1
  # DELETE /paintings/1.json
  def destroy
    @room = @painting.room
    @hotel = @room.hotel
    @painting.destroy
    respond_to do |format|
      format.html { redirect_to hotel_room_path(@hotel, @room) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_painting
      @painting = Painting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def painting_params
      params.require(:painting).permit(:name, :image, :room_id, :hotel_id, :remote_image_url)
    end
end
