class ApplicationController < ActionController::Base
  # devise由来の機能を使う前に↓が読み込まれる
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # sign_upの際にnameのデータ操作を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
  end
end
