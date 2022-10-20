class ProjectsController < ApplicationController
  before_action :set_user, only: %i[index show new edit update destroy]
  before_action :set_project, only: %i[index show new edit update destroy]
  before_action :authenticate_user!, :except => [:show]


  # before_action :user_backgrounds, only: %i[new create]
  # after_action :set_watch, only: %i[create]


  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by(public_uid: params[:id])
  end

  def new
    @project = Project.new
    # @user_backgrounds = Background.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user


    if @project.save
      redirect_to user_projects_path
      flash[:notice] = "project created"
    else
      flash.now[:error] = "could not create project"
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_project
    @project = Project.find_by(public_uid: params[:id])
  end

  # def set_watch
  #   Watch.create!
  # end

  # def user_backgrounds
  #   @backgrounds = @user.backgrounds
  # end

  def project_params
    params.require(:project).permit(:background_id, :video_id, :prospect_first,
                                    :prospect_last, :prospect_email, :prospect_company, :message)
  end
end
