class PagesController < ApplicationController

  def home
    @videos = Video.all
    @portrait_videos = Video.where(orientation: "Portrait")
    @landscape_videos = Video.where(orientation: "Landscape")
    @video = Video.find_by(id: params[:id])
    @home_video = Video.find_by(name: "Bird")
  end

  def about
  end

  def portfolio
    @videos = Video.all
    @portrait_videos = Video.where(orientation: "Portrait")
    @landscape_videos = Video.where(orientation: "Landscape")
    @video = Video.find_by(id: params[:id])
  end

  def contact
  end

end
