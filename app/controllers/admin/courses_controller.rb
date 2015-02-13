class Admin::CoursesController < ApplicationController
  before_action :check_admin_user, only: [:create, :destroy, :new]

  def new
    @course = Course.new
  end

  def index
    @courses = Course.paginate page: params[:page]
  end

  def show
    @course = Course.find params[:id]
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = "Create course successfully!"
      redirect_to admin_course_path(@course)
    else
      render 'new'
    end
  end

  private
  def check_admin_user
    if !current_user || (current_user && !current_user.admin?)
      flash[:danger] = 'You are not'
      redirect_to root_path
    end
  end
  def course_params
    params.require(:course).permit(:name, :description, :begin_at, :end_at,
                    course_subjects_attributes: [:id, :subject_id, :_destroy])
  end
end
