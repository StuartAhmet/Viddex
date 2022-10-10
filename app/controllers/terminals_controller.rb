class TerminalsController < ApplicationController
  # before_action :generate_random_id, only: %i[new create]
  before_action :randomize_id, only: %i[new create]


  def show

  end

  def new
    @terminal = Terminal.new
  end

  def create
    @terminal = Terminal.new
    if @terminal.save
      redirect_to terminal_path(@terminal)
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


end
