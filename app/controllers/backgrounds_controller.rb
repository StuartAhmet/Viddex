class BackgroundsController < ApplicationController
  before_action :set_user, only: %i[index show new edit create update destroy]

  def index
    @backgrounds = Background.all
  end

  def show
    @background = Background.find(params[:id])
  end

  def new
    @background = Background.new
  end

  def create
    @background = Background.new(background_params)
    @background.user = current_user
    if @background.save
      redirect_to user_backgrounds_path(@backgrounds)
    else
      render :new, stauts: :unprocessable_entity
    end
  end

  private

  def background_params
    params.require(:background).permit(:title, :photo)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end
