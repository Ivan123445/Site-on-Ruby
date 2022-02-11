# вспомогательные методы для модулей
module Authentication
  extend ActiveSupport::Concern

  included do
    private

    def current_user
      if session[:user_id].present?
        @current_user ||= User.find_by(id: session[:user_id]).decorate
      end # decorate используется для присваивания в поле имя емейл
    end

    def user_signed_in?
      current_user.present?
    end

    def require_authentication
      return if user_signed_in?

      flash[:warning] = t 'global.flash.not_signed_in'
      redirect_to root_path
    end

    def require_no_authentication
      return unless user_signed_in?

      flash[:warning] = t 'global.flash.already_signed_in'
      redirect_to root_path
    end

    def sign_in(user)
      session[:user_id] = user.id
    end

    def sign_out
      session.delete :user_id
      @current_user = nil
    end

    helper_method :current_user, :user_signed_in?      # делаем методы доступными в представлениях(делаем их хелперами)
  end
end
