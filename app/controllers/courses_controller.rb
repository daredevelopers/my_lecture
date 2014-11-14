class CoursesController < ApplicationController
  before_action :authenticate_lecturer!
  before_action :set_course, only: [:edit, :update, :destroy]

  def index
    @courses = current_lecturer.courses
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = current_user.courses.new course_params

    if @course.save
      redirect_to courses_path, notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  def update
    if @course.update course_params
      redirect_to courses_path, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = current_lecturer.courses.find params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name)
    end
end
