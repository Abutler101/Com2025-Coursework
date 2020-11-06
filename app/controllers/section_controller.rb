class SectionController < ApplicationController
  def show
    @section = Section.find(params[:id])
    @products = @section.products.order(created_at: :desc)
  end
end
