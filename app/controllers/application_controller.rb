class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required

  private
  def login_required
    unless current_user
      flash[:notice] = 'ログインしてください'
      redirect_to new_session_path
    end
  end

  def login_duplicated
    if current_user.present?
      flash[:notice] = 'そのページへは遷移できません'
      redirect_to tasks_path
    end
  end
end
