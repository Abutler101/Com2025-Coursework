class OrderController < ApplicationController
  def create

  end
  def show
    @order = Order.find(params[:id])
  end
end
