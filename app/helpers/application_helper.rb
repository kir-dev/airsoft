module ApplicationHelper
  def admin_signed_in?
    user_signed_in? and current_user.admin?
  end
end
