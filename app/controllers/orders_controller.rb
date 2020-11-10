class OrdersController < ApplicationController
  before_action :req_login
  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.new(email: params[:paymentEmail],
                      totalCost: cart_total,
                      user: curr_user)
    cart.each do |pId, info|
      if (prod = Product.find_by(id: pId))
        order.order_entries.new(
          product: prod,
          quantity: info["Num"].to_i,
          unitprice: prod.price,
          totalprice: prod.price * info["Num"].to_i
        )
      end
    end
    if order.save!
      clear_cart
      redirect_to order_path(order), notice: "Order has been placed"
    else
      redirect_to carts_path, error: "Failed to place order"
    end
  end

  private
  def clear_cart
    update_cart({})
  end

  def cart_total
    total = 0
    cart.each do |pId, info|
      if (prod = Product.find_by(id: pId))
        total += prod.price * info["Num"].to_i
      end
    end
    total
  end
end
