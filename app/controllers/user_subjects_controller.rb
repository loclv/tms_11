class UserSubjectsController < ApplicationController
  before_action :logged_in_user
  before_action :is_not_admin_user

  def update
    u_s = UserSubject.find params[:id]
    u_s.update_attributes user_subject_params
  end

  private
  def user_subject_params
    params.require(:user_subject).permit :user_id, :subject_id, :status
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in!"
      redirect_to login_url
    end
  end

  def is_not_admin_user
    if admin_user?
      flash[:danger] = "Please log in as normally user!"
      redirect_to root_url
    end
  end
end
