class ProductController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
  end
end
