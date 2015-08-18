class Api::V1::ProjectsController < ApplicationController

  def index

  end

  def show
    @project = Project.find_by(id: params[:id])
    @users = @project.users
      # .map { |user| "#{user.first_name} #{user.last_name}" }
      # .select {|name| name}
  end
end
