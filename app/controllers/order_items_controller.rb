class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[ show update destroy ]
  # GET /order_items
  # GET /order_items.json
  def index
  if params[:order_id].present?
    @order_items = OrderItem.where(order_id: params[:order_id])
  else
    @order_items = OrderItem.all
  end
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # POST /order_items
  # POST /order_items.json
  # def create
  # end


  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    if @order_item.update(order_item_params)
      render :show, status: :ok, location: @order_item
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end   
    # Only allow a list of trusted parameters through.
    def order_item_params
      params.require(:order_items).permit(:quantity, :product_price_in_cents, :cart_item_id)
    end
end
