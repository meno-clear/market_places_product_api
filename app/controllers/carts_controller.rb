class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show update destroy update_cart_items checkout ]

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
    render :show, status: :ok, location: @cart
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(total: 0, price_in_cents: 0)

    if @cart.save
      render :show, status: :created, location: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  def checkout
    CartService.checkout(params[:id], @current_user_id)
    render :show, status: :ok, location: @cart
  end 

  def update_cart_items
    CartService.handle_cart(params[:cart_item_id], params[:action_type], cart_item_params, @cart.id)
    render :show, status: :ok, location: @cart
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

    def cart_item_params
        params.require(:cart_item).permit(:cart_id, :product_id, :quantity, :product_name, :product_price_in_cents, :market_place_partner_id, :id, :total_price_in_cents, :total_price)
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:total, :price_in_cents)
    end
end
