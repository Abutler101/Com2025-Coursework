# Order controller - Convert carts to placed orders and manage store stock - must be logged in to interact
class OrdersController < ApplicationController
  before_action :req_login
  #Display a specific order
  def show
    @order = Order.find(params[:id])
  end

  # Convert a cart into an order - go through and check each cart entry, if in stock and valid then convert to an order
  # entry. If the order is valid after the creation of the entry then ammend stock levels. Once all valid entries are
  # generated save the whole thing and clear the shopping cart
  def create
    candidateOrder = Order.new(email: params[:order][:Email],
                      totalCost: cart_total,
                      user: curr_user)
    cart.each do |pId, info|
      if (prod = Product.find_by(id: pId))
        if prod.stockCount > info["Num"].to_i
          candidateOrder.order_entries.new(
            product: prod,
            quantity: info["Num"].to_i,
            unitprice: prod.price,
            totalprice: prod.price * info["Num"].to_i,
            order_id: candidateOrder.id
          )
          candidateOrder.order_entries.last.validate!
          if candidateOrder.valid?
            prod.stockCount -= info["Num"].to_i
            Product.update(prod.id, stockCount: prod.stockCount)
          end
        end
      end
    end
    if candidateOrder.save!
      clear_cart
      redirect_to order_path(candidateOrder), notice: t(:order_placed)
    else
      redirect_to carts_path, error: t(:order_failed)
    end
  end

  private
  # Empty the user's shopping cart
  def clear_cart
    update_cart({})
  end

  # Get total cost of all products in the cart
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
