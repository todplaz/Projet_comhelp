module Admin

class ApplicationController < ::ApplicationController
  before_action :only_admin

  private

    def only_admin
        if ! user_signed_in? || ! current_user.is_admin?
            flash[:danger] = "Vous ne pouvez pas acceder à cette page"
            redirect_to root_path
        end
      end

end

end

