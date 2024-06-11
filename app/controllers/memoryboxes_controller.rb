class MemoryboxesController < ApplicationController
  def index
    @memoryboxes = Memorybox.all
  end

  def new
    @timecapsule = Timecapsule.find(params[:timecapsule_id])
    @memorybox = Memorybox.new
  end

  def create
    @timecapsule = Timecapsule.find(params[:timecapsule_id])
    @memorybox = Memorybox.new(memorybox_params)
    @memorybox.user = current_user
    @memorybox.timecapsule = @timecapsule

    if @memorybox.save
      redirect_to timecapsule_path(@timecapsule)
    else
      render :new, status: :unprocessable_entity, notice: "Memorybox was not created"
    end
  end

  def ownmemories
    # TO DO : in case a user can have several memory boxes inside a time capsule, this needs to be extended
    @memorybox = Memorybox.find(params[:memorybox_id])
    if @memorybox.present?
      @time_capsule = Timecapsule.find(@memorybox.timecapsule_id)
      @memories = @memorybox.memories
    else
      # alert
    end
  end

  private

  def memorybox_params
    params.require(:memorybox).permit(:title)
  end
end
