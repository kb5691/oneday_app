module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :ensure_normal_user, only: :destroy

    def destroy; end

    def ensure_normal_user
      redirect_to root_path, alert: t(".alert") if resource.email == "guest@example.com"
    end
  end
end
