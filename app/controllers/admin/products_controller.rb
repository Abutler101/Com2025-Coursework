class Admin::ProductsController < Admin::AuthorisedController
  def index
    @products = Product.order(id: :desc).all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "New product created"
      redirect_to admin_products_path
    else
      render :'admin/products/new'
    end
  end

  def new
    @product = Product.new
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    flash[:success] = "Product deleted"
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :stockCount, :pricePence, :image, :section_id)
  end
end
