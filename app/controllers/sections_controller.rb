# Product section controller - Shows prdouct by section and all available sections
class SectionsController < ApplicationController
  # If the dropdown doesn't play ball an old fashioned table as back up is provided
  def index
    @sections = Section.all
  end

  #Show a specific section and it's products
  def show
    @section = Section.find(params[:id])
    @products = @section.products.order(created_at: :asc)
  end
end
