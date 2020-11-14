class Admin::SectionsController < Admin::AuthorisedController
  def index
    @sections = Section.order(id: :desc).all
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:success] = "New section created"
      redirect_to admin_sections_path
    else
      render :'admin/sections/new'
    end
  end

  def new
    @section = Section.new
  end

  def destroy
    @section = Section.find params[:id]
    @section.destroy
    flash[:success] = "Section deleted"
    redirect_to admin_sections_path
  end

  private
  def section_params
    params.require(:section).permit(:name)
  end
end
