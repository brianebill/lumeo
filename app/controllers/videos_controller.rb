class VideosController < ApplicationController
    def create
      @course = Course.find(params[:course_id])
      @video = @course.videos.create(params[:video])
      redirect_to course_path(@course)
    end

    def destroy
      @course = Course.find(params[:course_id])
      @video = @course.videos.find(params[:id])
      @video.destroy
      redirect_to course_path(@course)
    end
  end