class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :user_signed_in?, :current_user
  
  
    def user_signed_in?
        # 현재 유저가 있는지 없는지를 리턴
        session[:sign_in_user].present? # True면 있는거.
    end
  
    def authenticate_user
        redirect_to sign_in_path unless user_signed_in? # 로그인 되어있지 않다면 sign_in 페이지로 가라 (prefix사용)
    end

    def current_user
        @current_user = User.find(session[:sign_in_user]) if user_signed_in? # 유저가 로그인이 되어 있을때만 유저를 검색해줍니다.
    end

end
