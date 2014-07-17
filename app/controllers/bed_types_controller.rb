class BedTypesController < ApplicationController
  before_action :set_bed_type, only: [:show, :edit, :update, :destroy]

  # GET /bed_types
  # GET /bed_types.json
  def index
    @bed_types = BedType.all
  end

  # GET /bed_types/1
  # GET /bed_types/1.json
  def show
  end

  # GET /bed_types/new
  def new
    @bed_type = BedType.new
  end

  # GET /bed_types/1/edit
  def edit
  end

  # POST /bed_types
  # POST /bed_types.json
  def create
    @bed_type = BedType.new(bed_type_params)

    respond_to do |format|
      if @bed_type.save
        format.html { redirect_to bed_types_path, notice: 'Bed type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bed_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @bed_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bed_types/1
  # PATCH/PUT /bed_types/1.json
  def update
    respond_to do |format|
      if @bed_type.update(bed_type_params)
        format.html { redirect_to @bed_type, notice: 'Bed type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bed_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bed_types/1
  # DELETE /bed_types/1.json
  def destroy
    @bed_type.destroy
    respond_to do |format|
      format.html { redirect_to bed_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bed_type
      @bed_type = BedType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bed_type_params
      params.require(:bed_type).permit(:name)
    end
end
