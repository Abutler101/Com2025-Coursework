class CartsController < ApplicationController
  before_action :req_login
  def add_item
    prod_id = params[:product_id].to_s
    item = cart[prod_id] || {"Num" => 0}
    item["Num"] += 1
    cart[prod_id] = item
    update_cart cart
    redirect_back fallback_location: :root_url
  end

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
