class OrganizationsController < ApplicationController

  def new
    @organization = Organization.new
  end

  def create
    #must be logged in to create an organization
    
    @organization = Organization.create(organization_params)

    #need to assign organization to current_user

    redirect_to "/organizations/#{@organization.id}"
  end

  def edit
    organization_id = params[:id]
    @organization = Organization.find_by(id: organization_id)
  end

  def update
    organization_id = params[:id]
    @organization = Organization.find_by(id: organization_id)
    @organization.update(organization_params)
    
    flash[:info] = "Organization updated"
    redirect_to "/organizations/#{organization_id}"
  end

  def show
    @organization = Organization.find_by(id: params[:id])
    @projects = Project.where(organization_id: @organization.id)
    @user = User.find_by(id: params[:id])
  end

  private 

  def organization_params
    params.require(:organization).permit(:company_name, :address, :address2, :city, :state, :postal_code, :website, :mission, :conpany_size, :logo)
  end


end
