class UsersController < ApplicationController
  before_action :generate_random_id, only: %i[create]

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def generate_random_id
    self.id = SecureRandom.uuid
  end



end
