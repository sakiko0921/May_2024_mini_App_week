class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :warning

  private

  def require_login
    redirect_to login_path, warning: "ログインしてください" unless current_user
  end

  def not_authenticated
    redirect_to login_path, danger: "ログインしてください"
  end
end
