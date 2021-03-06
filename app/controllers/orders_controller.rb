class OrdersController < ApplicationController

  def index
    @orders = current_user.orders.recent
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    @order = current_user.orders.build
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to orders_url, notice: '注文に成功しました。'
    else
      redirect_to cart_url, notice: '注文に失敗しました。'
    end
  end

  private

  def order_params
    params.require(:order).permit(
        :delivery_date, :delivery_timezone
    )
  end

end
