class SchedulersController < ApplicationController

  def index
    #This is the landing page for all site visitors
    if current_user
      redirect_to "/schedulers/#{current_user.id}"
    end
  end

  def show

    @user = User.find_by(id: params[:id])

    if @user.role_id == 2
    @organization = current_user.organization
    end
  end

  def search
    search_term = params[:search]

    @projects = Project.where("project_name LIKE ? OR description LIKE ?", "%#{search_term}%", "%#{search_term}%")
    @organizations = Organization.where("company_name LIKE ? OR mission LIKE ?", "%#{search_term}%", "%#{search_term}%")
    @categories = Category.where("category_name LIKE ?", "%#{search_term}%")

    @results = @projects + @organizations
  end
end
