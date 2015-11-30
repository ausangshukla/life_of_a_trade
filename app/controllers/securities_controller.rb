class SecuritiesController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!
  before_action :set_security, only: [:show, :edit, :update, :destroy]

  # GET /securities
  # GET /securities.json
  def index
    @securities = Security.all
  end
  
  def search
   @securities = Security.search params[:term], :star=>true
  end

  # GET /securities/1
  # GET /securities/1.json
  def show
  end

  # GET /securities/new
  def new
    @security = Security.new
  end

  # GET /securities/1/edit
  def edit
  end

  # POST /securities
  # POST /securities.json
  def create
    @security = Security.new(security_params)

    respond_to do |format|
      if @security.save
        format.html { redirect_to @security, notice: 'Security was successfully created.' }
        format.json { render action: 'show', status: :created, location: @security }
      else
        format.html { render action: 'new' }
        format.json { render json: @security.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /securities/1
  # PATCH/PUT /securities/1.json
  def update
    respond_to do |format|
      if @security.update(security_params)
        format.html { redirect_to @security, notice: 'Security was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @security.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /securities/1
  # DELETE /securities/1.json
  def destroy
    @security.destroy
    respond_to do |format|
      format.html { redirect_to securities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security
      @security = Security.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def security_params
      params.require(:security).permit(:name, :ticker, :description, :price, :asset_class, 
        :region, :sector, :tick_size, :liquidity)
    end
end
