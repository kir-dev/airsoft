class ApplicationController < ActionController::Base
  protected
    def check_admin
      unless user_signed_in? and current_user.admin?
        render(layout: "layouts/application", template: "layouts/_html_error", 
          locals: { code: 403, message: "Nincs hozzáférésed a tartalom kezeléséhez." })
      end
    end
  def login_required
    redirect_to root_url, notice: "Login required" unless user_signed_in?
  end
end
