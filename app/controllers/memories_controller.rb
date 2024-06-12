class MemoriesController < ApplicationController
  def new
    @memorybox = Memorybox.find(params[:memorybox_id])
    @memory = Memory.new
  end

  def show
    @memorybox = Memorybox.find(params[:memorybox_id])

    @memory = Memory.find(params[:id])
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

  def destroy
    @memory = Memory.find(params[:id])
    @memorybox = Memorybox.find(params[:memorybox_id])

    if @memory.destroy
      redirect_to ownmemories_path(@memorybox), notice: "Memory was successfully destroy."
    else
      head :no_content
    end
  end

  private

  def memory_params
    params.require(:memory).permit(:text, :date_of_memory, :media, :title)
  end
end
