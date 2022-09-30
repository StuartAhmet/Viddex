class TerminalsController < ApplicationController
  before_action :generate_random_id, only: %i[create]

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
  def generate_random_id
    self.id = SecureRandom.uuid
  end



end
