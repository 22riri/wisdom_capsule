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


    if @memorybox.present?
      @time_capsule = Timecapsule.find(@memorybox.timecapsule_id)
      @memories = @memorybox.memories.includes(media_attachment: :blob)

      if params[:media].present? || params[:query].present?
        @memories = @memories.search_by_title_and_text(params[:query]) if params[:query].present?

        if params[:media] == "video"
          @memories = @memories.filter{ | memory | memory.media.present? && (memory.media.blob.content_type.starts_with?("video"))}
        elsif params[:media] == "photo"
          @memories = @memories.filter{ | memory | memory.media.present? && (memory.media.blob.content_type.starts_with?("image/jpeg") || memory.media.blob.content_type.starts_with?("image/png"))}
        elsif params[:media] == "audio"
          @memories = @memories.filter{ | memory | memory.media.present? && (memory.media.blob.content_type.starts_with?("audio"))}
        elsif params[:media] == "all"
          @memories = @memories
        end
      else
        @memories = @memorybox.memories
      end
    end
    respond_to do |format|
      format.html
      format.text { render partial: "memorylist", locals: {memories: @memories}, formats: [:html] }
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
