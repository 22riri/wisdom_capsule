class TimecapsulesController < ApplicationController
  before_action :set_timecapsule, only: [ :show ]
  def index
    @timecapsules = Timecapsule.all
  end

  def new
    @timecapsule = Timecapsule.new
  end

  def show
  end

  def create
    @timecapsule = Timecapsule.new(timecapsule_params)
    @timecapsule.user = current_user

    if @timecapsule.save
      redirect_to timecapsule_path(@timecapsule), notice: "Timecapsule was successfully created."
    else
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    @timecapsule.user = current_user

    if @timecapsule.destroy
      redirect_to timecapsule_path(@timecapsule), notice: "Timecapsule was successfully destroy."
    else
      head :no_content
    end
  end

  private

  def set_timecapsule
    @timecapsule = Timecapsule.find(params[:id])
  end

  def timecapsule_params
    params.require(:timecapsule).permit(:name)
  end
end
