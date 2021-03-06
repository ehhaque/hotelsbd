class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :edit, :update]
  before_action :user_signed_in?, only: [:index, :edit, :update]


  # GET /hotels
  # GET /hotels.json
  def index
     @hotels = current_user.hotels.all
  end

  def all_hotels
     #@hotels = Hotel.all
     @hotels = Hotel.paginate(page: params[:page])
  end
    

  # GET /hotels/1
  # GET /hotels/1.json
  def show
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
    @cities = City.all
  end

  # GET /hotels/1/edit
  def edit
  end

  # POST /hotels
  # POST /hotels.json
  def create
    
    @hotel = current_user.hotels.build(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to hotels_path, notice: 'Hotel was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hotel }
      else
        format.html { render action: 'new' }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to hotels_path, notice: 'Hotel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_params
      params.require(:hotel).permit(:name, :desc, :star_rating, :address, :city)
    end
end
