class UsersController < ApplicationController
  # before_action :generate_random_id, only: %i[new create]
  before_action :create_unique_identifier, only: %i[create], if: :devise_controller?




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
  def create_unique_identifier
    loop do
      self. unique_identifier = SecureRandom.hex(5) # or whatever you chose like UUID tools
      break unless self.class.exists?(:unique_identifier => unique_identifier)
    end
  end

  def user_params
  params.require(:user).permit(:first_name, :last_name, :company_name, :industry, :email, :password)
  end



end
