class UsersController < ApplicationController
  # before_action :generate_random_id, only: %i[new create]
  before_action :randomize_id, only: %i[create], if: :devise_controller?


  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  # def generate_random_id
  #   self.id = SecureRandom.uuid
  # end
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Model.where(id: self.id).exists?
  end

  def user_params
  params.require(:user).permit(:first_name, :last_name, :company_name, :industry, :email, :password)
  end



end
