# Order manager controller - inherits admin check from auth controller
class Admin::OrdersController < Admin::AuthorisedController
  # Display a table of all orders sorted by ID
  def index
    @orders = Order.order(id: :desc).all
  end

  # Delete order and all order entries
  def destroy
    @order = Order.find params[:id]
    @order.destroy
    flash[:success] = "Order deleted"
    redirect_to admin_orders_path
  end
end
