class MemoryboxesController < ApplicationController
  def index
    @memoryboxes = Memorybox.all
  end

  def new
    @timecapsule = Timecapsule.find(params[:timecapsule_id])
    @memorybox = Memorybox.new
    @memorybox.user = current_user
    @memorybox.timecapsule = @timecapsule
  end

  def create
    @timecapsule = Timecapsule.find(params[:timecapsule_id])
    @memorybox = Memorybox.new(memorybox_params)
    @memorybox.user = current_user
    @memorybox.timecapsule = @timecapsule

    if @memorybox.save
      redirect_to ownmemories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def memorybox_params
    params.require(:memorybox).permit(:title)
  end
end
