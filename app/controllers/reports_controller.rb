class ReportsController < ApplicationController
  def edit
    redirect_to user_reports_path(current_user)
  end

  def index
    @user = User.find params[:user_id]
  end
end
