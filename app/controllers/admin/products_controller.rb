# Product manager controller - inherits admin check from auth controller
class Admin::ProductsController < Admin::AuthorisedController
  # Display a table of all products sorted by ID
  def index
    @products = Product.order(id: :desc).all
  end

  # From given strong params create and store new product
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "New product created"
      redirect_to admin_products_path
    else
      render :'admin/products/new'
    end
  end

  # Use form to gather required info for new product
  def new
    @product = Product.new
  end

  # Delete a target product
  def destroy
    @product = Product.find params[:id]
    @product.destroy
    flash[:success] = "Product deleted"
    redirect_to admin_products_path
  end

  private
  # A product can only take name, description, stock count, price, image and section as parameters
  def product_params
    params.require(:product).permit(:name, :description, :stockCount, :pricePence, :image, :section_id)
  end
end
