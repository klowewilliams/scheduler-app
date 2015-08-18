class Api::V1::UserProjectsController < ApplicationController

  def index
    @project = Project.find_by(id: params[:project_id])
    @user_projects = @project.user_projects
  end

  def create
    @user_project = UserProject.new(user_id: params[:user_id], project_id: params[:project_id], start_date: params[:startDate].to_datetime)

    if @user_project.save
      render :json => {status: "Volunteer added"}
    else

    end
  end
end
