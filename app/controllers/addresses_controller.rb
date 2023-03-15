class AddressesController < ApplicationController
  before_action :set_address, only: %i[ show update destroy ]

  # GET /addresses
  # GET /addresses.json
  def index
    if params[:user].present?
      @addresses = Address.where(user_id: params[:user])
    else
      @addresses = Address.all
    end
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)
    @address.coordinates = set_coordinates

    if @address.save
      render :show, status: :created, location: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    @address.coordinates = set_coordinates if @address.present?
    if @address.update(address_params)
      render :show, status: :ok, location: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.

    def set_coordinates
      if address_params[:longitude].present? && address_params[:latitude].present?
        factory = RGeo::Geographic.spherical_factory(srid: 4326)
        point = factory.point(address_params[:longitude],address_params[:latitude])
        wkt =  RGeo::WKRep::WKTGenerator.new.generate(point)
        wkt
      else
        nil
      end
    end

    def address_params
      params.require(:address).permit(:user_id, :address, :street, :number, :district, :city, :state, :country, :postal_code, :type, :longitude, :latitude, :coordinates)
    end
end
