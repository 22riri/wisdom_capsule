class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @timecapsules = current_user.timecapsules
    @memoryboxes = current_user.memoryboxes
  end
end
