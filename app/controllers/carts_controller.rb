class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show update destroy ]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    cart_items = @cart.cart_items
  market_place_partners = cart_items.map { |cart_item| {
    name: cart_item.market_place_partner.name, 
    id: cart_item.market_place_partner.id } 
  }
    render json: {  **@cart.as_json,
                    total_items: @cart.total_items,
                    cart_items: cart_items,
                  }, status: :ok, location: @cart
                    market_place_partners: market_place_partners.uniq
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      render :show, status: :created, location: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    if @cart.update(cart_params)
      render :show, status: :ok, location: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:total, :price_in_cents)
    end
end