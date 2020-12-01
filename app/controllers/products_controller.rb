# Product controller - manage the home page table and per product views
class ProductsController < ApplicationController
  # Display the table of products by date added
  def index
    @products = Product.all.order(created_at: :desc)
    render stream: true
  end

  # Display a specific product given an ID
  def show
    @product = Product.find params[:id]
  end
end
