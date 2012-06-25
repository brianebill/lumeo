class VideosController < ApplicationController
    def create
      @course = Course.find(params[:course_id])
      @video = @course.videos.create(params[:video])
      redirect_to course_path(@course)
    end
    
    # GET /videos/new
    def new
      @video = Video.new
      @image = @video.build_image
    end

    def destroy
      @course = Course.find(params[:course_id])
      @video = @course.videos.find(params[:id])
      @video.destroy
      redirect_to course_path(@course)
    end
  end