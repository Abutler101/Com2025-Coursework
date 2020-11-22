# Shopping cart controller - track items and manage quantities. Must be logged in to interact with
class CartsController < ApplicationController
  before_action :req_login
  # Add target product id to the cart after checking it is a real product
  def add_item
    prod_id = params[:product_id].to_s
    unless Product.find(prod_id).nil?
      item = cart[prod_id] || {"Num" => 0}
      item["Num"] += 1
      cart[prod_id] = item
      update_cart cart
      redirect_back fallback_location: :root_url
    end
  end

  # Remove target product id from cart
  def remove_item
    prod_id = params[:product_id].to_s
    item = cart[prod_id] || {"Num" => 0}
    item["Num"] -=1
    cart[prod_id] = item
    cart.delete(prod_id) if item["Num"] < 1
    update_cart cart
    redirect_back fallback_location: :root_url
  end
end
