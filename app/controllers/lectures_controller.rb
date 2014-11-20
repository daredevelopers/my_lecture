class LecturesController < ApplicationController
  before_action :authenticate_lecturer!

  def index
    @lectures = current_lecturer.lectures
  end

  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = current_lecturer.lectures.new lecture_params
    if @lecture.save
      redirect_to lectures_path, notice: "Lecture created successfully."
    else
      render :new
    end
  end

  private
    def lecture_params
      params.require(:lecture).permit(:course_id, :name, :video)
    end
end