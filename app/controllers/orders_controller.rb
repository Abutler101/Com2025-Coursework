class OrdersController < ApplicationController
  before_action :req_login
  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.new(email: params[:order][:Email],
                      totalCost: cart_total,
                      user: curr_user)
    cart.each do |pId, info|
      if (prod = Product.find_by(id: pId))
        if prod.stockCount > info["Num"].to_i
          order.order_entries.new(
              product: prod,
              quantity: info["Num"].to_i,
              unitprice: prod.price,
              totalprice: prod.price * info["Num"].to_i
          )
          if order.valid?
            prod.stockCount -= info["Num"].to_i
            Product.update(prod.id, stockCount: prod.stockCount)
          end
        end
      end
    end
    if order.save!
      clear_cart
      redirect_to order_path(order), notice: t(:order_placed)
    else
      redirect_to carts_path, error: t(:order_failed)
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
