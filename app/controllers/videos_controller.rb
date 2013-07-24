class VideosController < ApplicationController
before_filter :authorize_admin_only, except: [:show]
before_filter :authorize_admin_and_those_who_ordered, only: [:show]

  def index
    @videos = Video.all
  end


  def new
    @video = Video.new
  end


  def show
    @video = Video.find(params[:id])
  end


  def edit
    @video = Video.find(params[:id])
  end


  def create
    @video = Video.new(params[:video])
    if @video.save
      redirect_to video_url(@video), notice: "You successfully created a video"
    else
      render :new
    end
  end


  def destroy
    video = Video.find(params[:id])
    video.destroy
    redirect_to videos_url
  end


  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(params[:video])
      redirect_to video_url(@video), notice: "You successfully updated the video"
    else
      render :edit
    end
  end
end
