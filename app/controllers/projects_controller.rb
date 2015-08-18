class ProjectsController < ApplicationController

  def calendar
    
  end

  def new
    @project = Project.new
    @user = User.find_by(id: params[:id])
  end

  def create
    @project = Project.create(project_params)

    redirect_to "/projects/#{@project.id}"
  end

  def edit
    project_id = params[:id]
    @project = Project.find_by(id: project_id)
  end

  def update
    project_id = params[:id]
    @project = Project.find_by(id: project_id)
    @project.update(project_params)
    
    flash[:info] = "Project updated"
    redirect_to "/projects/#{project_id}"
  end


  def show
    @project = Project.find_by(id: params[:id])
    @category = Category.find_by(id: @project.category_id)
    @exists = "undefined"
    if current_user
      @user = User.find_by(id: current_user.id)
      @exists = UserProject.exists?(user_id: @user.id, project_id: @project.id)
    end
  end

  def addvolunteer
      project = Project.find(params[:project_id])


      exists = UserProject.exists?(user_id: params[:user_id], project_id: params[:project_id])
      if(!exists)
        user_project = UserProject.create(user_id: params[:user_id], project_id: params[:project_id])
      end
      
      if user_project.save
        project.slots -= 1
        project.save
        render :json => {status: "You have signed up for this project!", project: project}
      elsif exists
        render :json => {status: "Yo what you trying to sign up for again"}
      else
        render :json => {status: "Save failed"}
      end  
  end

  def removeuserfromproject
    project = Project.find(params[:project_id])
    project.slots += 1
    project.save
    user_project = UserProject.where(user_id: params[:user_id], project_id: params[:project_id])
    user_project.destroy_all

    render :json => {status: "You have been removed from this project.", project: project}
  end


  private 

  def project_params
    params.require(:project).permit(:project_name,:category_id, :organization_id, :location, :description, :start_date, :end_date, :slots, :status, :image)
  end
end