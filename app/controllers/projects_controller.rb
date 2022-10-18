class ProjectsController < ApplicationController
  before_action :set_user, only: %i[index show new edit update destroy]
  before_action :set_background, only: %i[create]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @backgrounds = User.backgrounds
  end

  def create
    @project = Project.new
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_background
    @background = Background.find(params[:background_id])
  end
end
