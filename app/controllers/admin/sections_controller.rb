# Section manager controller - inherits admin check from auth controller
class Admin::SectionsController < Admin::AuthorisedController
  # List all existing sections by ID
  def index
    @sections = Section.order(id: :desc).all
  end

  # Create and store new section from given strong params
  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:success] = "New section created"
      redirect_to admin_sections_path
    else
      render :'admin/sections/new'
    end
  end

  # Use form to gather info for new section
  def new
    @section = Section.new
  end

  # Delete target section and all products in the section
  def destroy
    @section = Section.find params[:id]
    @section.destroy
    flash[:success] = "Section deleted"
    redirect_to admin_sections_path
  end

  private
  # A section can only take the param of name
  def section_params
    params.require(:section).permit(:name)
  end
end
