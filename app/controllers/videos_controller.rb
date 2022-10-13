class VideosController < ApplicationController
  # before_action :set_terminal, only: [:index, :new, :create]
  before_action :set_user, only: %i[index show new edit update destroy]

  def index
    @videos = Video.all
    @referer = request.referer

  end

  def show
    @videos = Video.all
    @video = Video.find(params[:id])
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @video.update(video_params)
    redirect_to user_video_path
  end

  def new
    @video = Video.new
  end





  def create
    @video = Video.new(video_params)
    @video.user = current_user
    # @video = @terminal.videos.new
    if @video.save
      redirect_to user_videos_path(@video)
    else
      render :new, stauts: :unprocessable_entity
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    # redirect_to terminal_videos_path, notice: 'Video deleted', status: :see_other
  end

  private

  # def set_terminal
  #   @terminal = Terminal.find(params[:terminal_id])
  # end

  def video_params
    params.require(:video).permit(:title, :cadence_step, :addressed, :file, :background)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
