class VideosController < ApplicationController
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
      redirect_to video_path(@video), notice: "You successfully created a video"
    else
      render :new
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_path
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(params[:video])
      redirect_to video_path(@video), notice: "You successfully updated the video"
    else
      render :edit
    end
  end
end