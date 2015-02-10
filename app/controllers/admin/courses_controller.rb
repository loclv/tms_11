class Admin::CoursesController < ApplicationController
  before_action :check_admin_user, only: [:create, :destroy, :new]

  def new
    @course = Course.new
    user = @course.users.build
  end

  def index
    @courses = Course.paginate page: params[:page]
  end

  def show
    @course = Course.find params[:id]
    @users = @course.users.paginate page: params[:page]
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
  def set_course
    @course = Course.find params[:id]
  end

  private
  def course_params
    params.require(:course).permit(:name, :description, :begin_at, :end_at)
  end

  def check_admin_user
    if !current_user || (current_user && !current_user.admin?)
      flash[:danger] = 'You are not'
      redirect_to root_path
    end
  end
end
