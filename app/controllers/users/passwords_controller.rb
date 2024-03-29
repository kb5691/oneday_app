module Users
  class PasswordsController < Devise::PasswordsController
    before_action :ensure_normal_user, only: :create

    def create
      super
      create_internal
    end

    def create_internal; end

    def ensure_normal_user
      redirect_to new_user_session_path, alert: t(".alert") if params[:user][:email].casecmp("guest@example.com").zero?
    end
  end
end
