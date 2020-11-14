class Admin::OrdersController < Admin::AuthorisedController
  def index
    @orders = Order.order(id: :desc).all
  end

  def destroy
    @order = Order.find params[:id]
    @order.destroy
    flash[:success] = "Order deleted"
    redirect_to admin_orders_path
  end
end
