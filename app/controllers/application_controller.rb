class ApplicationController < ActionController::Base
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  protected

  def check_admin
    unless user_signed_in? && current_user.admin?
      render(layout: 'layouts/application', template: 'layouts/_html_error',
             locals: { code: 403, message: 'Nincs hozzáférésed a tartalom kezeléséhez.' })
    end
  end

  def login_required
    unless user_signed_in?
      render(layout: 'layouts/application', template: 'layouts/_html_error',
             locals: { code: 403, message: 'A tartalom hozzáféréséhez be kell jelentkezned' })
    end
  end
end
