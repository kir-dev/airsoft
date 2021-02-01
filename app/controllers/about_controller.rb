class AboutController < ApplicationController
  # Index page for /about
  def index
    render :index
  end

  # Temporary calls
  def home
    render :home
  end

  def gallery
    render :gallery
  end

  def calendar
    render :calendar
  end
end
