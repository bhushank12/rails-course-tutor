class Api::V1::CoursesController < ApplicationController
  def create
    course = Course.new(course_params)

    if course.save
      render json: course, status: :created
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  def index
    courses = Course.includes(:tutors).all

    render json: courses.as_json(include: :tutors), status: :ok
  end

  private

  def course_params
    params.require(:course).permit(
      :name, :start_date, :end_date, :description,
      tutors_attributes: [
        :name, :email
      ]
    )
  end
end
