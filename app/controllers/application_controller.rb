class ApplicationController < ActionController::Base
  # devise由来の機能を使う前に↓が読み込まれる
  # ↓権限の設定 topとabout(sign_in, out)以外は遷移できない
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end  
  
  def after_sign_out_path_for(resource)
    '/'
  end  

  protected

  # sign_upの際にnameのデータ操作を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
  end
end
