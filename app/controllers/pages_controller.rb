class PagesController < ApplicationController

  def home
    @videos = Video.all
    @video = Video.find_by(id: params[:id])
  end

  def about
  end

  def portfolio
  end

  def contact
  end

end
