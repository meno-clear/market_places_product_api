class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[ show update destroy ]
  before_action :create_cart, only: %i[ create ]
  # GET /cart_items
  # GET /cart_items.json
  def index
    if params[:cart_id].present?
      @cart_items = CartItem.where(cart_id: params[:cart_id])
    else
      @cart_items = CartItem.all
    end
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
   @cart_items = cart_item_params[:cart_items].map do |cart_item|
                                   new_cart_item = CartItem.new(
                                   cart_id: @cart.id, 
                                   market_place_partner_id: cart_item[:market_place_partner_id],
                                   product_id: cart_item[:product_id], 
                                   quantity: cart_item[:quantity],
                                   product_name: cart_item[:product_name],
                                   product_price_in_cents: cart_item[:product_price_in_cents],
                                   )
                                   if new_cart_item.save
                                    total_price = new_cart_item.product_price_in_cents * new_cart_item.quantity
                                     @cart.price_in_cents += total_price
                                     new_cart_item
                                   else
                                     new_cart_item.errors
                                   end
                                end
   @cart.total = @cart.price_in_cents/100
   if @cart.save
     if @cart_items.map { |cart_item| cart_item.is_a?(CartItem) }
       render json: @cart , status: :created, location:  @cart
     else
       render json: {errors:'somethings is wrong'}, status: :unprocessable_entity
     end
   else
     render json: {errors: cart.errors}, status: :unprocessable_entity
   end
 end


  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
   if @cart_item.update(update_cart_item_params)
      render :show, status: :ok, location: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    def update_cart_item_params
      params.require(:cart_item).permit(:quantity)
    end

  def create_cart
    @cart = Cart.new(price_in_cents: 0, total: 0)
    @cart.save
  end
    # Only allow a list of trusted parameters through.
    def cart_item_params
    params.require(:items).permit(:cart_items => [:product_name, :product_price_in_cents, :quantity, :cart_id, :product_id, :market_place_partner_id])
    end
end
