class JoinElementsController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :set_video, only: %i[show new create]

  def show
    @join_elements = JoinElement.where(video_id: @video.id)
  end

  def new
    @user = User.find(params[:user_id])
    @join_element = JoinElement.new
  end

  def create
    @backgrounds = Background.where(id: params.dig(:join_element, :background_id))
    return render_new if @backgrounds.empty?

    ActiveRecord::Base.transaction do
      @backgrounds.each do |item|
        @join_element = JoinElement.new(video: @video, background: item)
        @join_element.save!
      end
      redirect_to user_video_path(@user, @video, @join_element)
    end
  rescue ActiveRecord::RecordInvalid
    render_new
  end


  private
  def set_background
    @background = Background.find(params[:background_id])
  end

  def set_video
    @video = Video.find(params[:video_id])

  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
