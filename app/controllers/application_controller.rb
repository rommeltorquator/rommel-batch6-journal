class ApplicationController < ActionController::Base
    before_action :set_page_defaults
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    # devise redirect path after logging in
    def after_sign_in_path_for(resource)
        dashboard_path
    end

    def set_page_defaults
        @page_title = "Organize - Be efficient with your time"
    end    

    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end
end