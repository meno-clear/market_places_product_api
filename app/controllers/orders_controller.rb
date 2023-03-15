class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]

  # GET /orders
  # GET /orders.json
  def index
    if params[:user_id].present?
@orders = Order.where(user_id: params[:user_id]).or(Order.where(market_place_partner_id: params[:market_place_partner_id]))    else
      @orders = Order.all
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    if @order.save
      render :show, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    if @order.update(order_params)
      render :show, status: :ok, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:total, :price_in_cents, :user_id, :cart_id, :market_place_partner_id)
    end
end
