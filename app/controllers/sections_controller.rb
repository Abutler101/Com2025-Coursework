class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end
  def show
    @section = Section.find(params[:id])
    @products = @section.products.order(created_at: :asc)
  end
end
