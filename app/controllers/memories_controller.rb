class MemoriesController < ApplicationController
  def new
    @memorybox = Memorybox.find(params[:memorybox_id])
    @memory = Memory.new
  end

  def create
    @memorybox = Memorybox.find(params[:memorybox_id])
    @memory = Memory.new(memory_params)
    @memory.memorybox = @memorybox

    if @memory.save
      redirect_to ownmemories_path(@memorybox)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def ownmemories
    # TO DO : in case a user can have several memory boxes inside a time capsule, this needs to be extended
    @memorybox = Memorybox.where(id: params[:memorybox_id], user: current_user)[0]

    if @memorybox.present?
      @time_capsule = Timecapsule.find(@memorybox.timecapsule_id)
      @memories = @memorybox.memories
    else
      # alert
    end
  end

  private

  def memory_params
    params.require(:memory).permit(:text, :date_of_the_memory)
  end
end
