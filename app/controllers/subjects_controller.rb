class SubjectsController < ApplicationController
  before_action :logged_in_user

  def index
    @subjects = current_user.subjects
  end

  def show
    @subject = Subject.find params[:id]
  end

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in!"
      redirect_to login_url
    end
  end
end
