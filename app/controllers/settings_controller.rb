class SettingsController < ApplicationController
  before_action :set_user, only: %i[index show new edit update destroy]
  def index
    @settings = Setting.all
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
