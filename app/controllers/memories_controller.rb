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
      redirect_to ownmemories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def ownmemories
    @memories = current_user.memories
  end

  private

  def memory_params
    params.require(:memory).permit(:text, :date_of_the_memory)
  end
end
