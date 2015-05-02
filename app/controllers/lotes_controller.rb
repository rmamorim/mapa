class LotesController < ApplicationController
  before_action :set_lote, only: [:show, :edit, :update, :destroy]

  # GET /lotes
  # GET /lotes.json
  def index
    @lotes = Lote.all

    #Lote.create(numero:11, coord:'-22.518196177103885,-42.96661900946674;-22.518104472490837,-42.96651356485108;-22.51839325864269,-42.966355793093875;-22.518484532177624,-42.966461232978226')

    # @hash_markers = Gmaps4rails.build_markers(@lotes) do |lote, marker|
    #   coords = lote.coord.split(';')
    #   coord = coords[0].split(',')
    #   marker.lat coord[0]
    #   marker.lng coord[1]
    #   marker.infowindow "lote " << lote.numero.to_s
    # end


    lines = []
    @lotes.each do |lote|
        line = []
        i = 0
        first_lat = first_lon = ''

        lote.coord.split(';').each do |c|
          coord = c.split(',')

          ###
          ###   +
          ###  Lat
          ###   -
          ###
          ###  + Lon -
          ###

          lat = coord[0].to_f + 0.000025
          lon = coord[1].to_f - 0.000045

          if i == 0 then
            first_lat = lat
            first_lon = lon
          end
          line << { :lat => lat, :lng => lon }
          i += 1
        end
        line << { :lat => first_lat, :lng => first_lon }
        lines << line

     end

    param = { :strokeColor => '#FFFF00', :strokeWeight => 2}
    aux = lines.to_json << " , " << param.to_json
    @polylines = aux


  end

  # GET /lotes/1
  # GET /lotes/1.json
  def show
  end

  # GET /lotes/new
  def new
    @lote = Lote.new
  end

  # GET /lotes/1/edit
  def edit
  end

  # POST /lotes
  # POST /lotes.json
  def create
    @lote = Lote.new(lote_params)

    respond_to do |format|
      if @lote.save
        format.html { redirect_to @lote, notice: 'Lote was successfully created.' }
        format.json { render :show, status: :created, location: @lote }
      else
        format.html { render :new }
        format.json { render json: @lote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lotes/1
  # PATCH/PUT /lotes/1.json
  def update
    respond_to do |format|
      if @lote.update(lote_params)
        format.html { redirect_to @lote, notice: 'Lote was successfully updated.' }
        format.json { render :show, status: :ok, location: @lote }
      else
        format.html { render :edit }
        format.json { render json: @lote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lotes/1
  # DELETE /lotes/1.json
  def destroy
    @lote.destroy
    respond_to do |format|
      format.html { redirect_to lotes_url, notice: 'Lote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lote
      @lote = Lote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lote_params
      params.require(:lote).permit(:numero, :superficie, :memorial, :coord)
    end
end
