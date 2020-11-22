# Product section controller - Shows prdoucts in a given section
class SectionsController < ApplicationController

  #Show a specific section and it's products
  def show
    @section = Section.find(params[:id])
    @products = @section.products.order(created_at: :asc)
  end
end
