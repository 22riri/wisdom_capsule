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
    @memorybox = Memorybox.where(id: params[:memorybox_id], user: current_user)[0]

    if @memorybox.present?
      @timecapsule = Timecapsule.find(@memorybox.timecapsule_id)
      @memories = @memorybox.memories.includes(media_attachment: :blob)

      if params[:media].present? || params[:query].present?
        @memories = @memories.search_by_title_and_text(params[:query]) if params[:query].present?

        if params[:media] == "video"
          @memories = @memories.filter do |memory|
            memory.media.present? && memory.media.blob.content_type.starts_with?("video")
          end
        elsif params[:media] == "photo"
          @memories = @memories.filter do |memory|
            memory.media.present? && (memory.media.blob.content_type.starts_with?("image/jpeg") || memory.media.blob.content_type.starts_with?("image/png"))
          end
        elsif params[:media] == "audio"
          @memories = @memories.filter do |memory|
            memory.media.present? && memory.media.blob.content_type.starts_with?("audio")
          end
        elsif params[:media] == "text_memory"
          @memories = @memories.filter { |memory| !memory.media.present? }
        elsif params[:media] == "all"
          @memories
        end
      else
        @memories
      end
    end
    respond_to do |format|
      format.html
      format.text { render partial: "memorylist", locals: { memories: @memories }, formats: [:html] }
    end
  end

  private

  def memorybox_params
    params.require(:memorybox).permit(:title)
  end
end
