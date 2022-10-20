class WatchesController < ApplicationController

  def show
    @watch = Watch.find(params[:id])
  end

  def new
    @watch = Watch.new
  end

  def create
    @watch = Watch.new
    if @watch.save
      redirect_to user_projects_path
    else
      render :new, stauts: :unprocessable_entity
    end
  end

end
