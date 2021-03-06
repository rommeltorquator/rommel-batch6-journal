class ApplicationController < ActionController::Base
    include Pagy::Backend
    
    before_action :set_page_defaults
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_language
    
    # devise redirect path after logging in
    def after_sign_in_path_for(resource)
        dashboard_path
    end

    def set_page_defaults
        @page_title = t('page_title')
    end

    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :language])
    end

    def set_language
        if current_user
            current_user.language == 'English' ? I18n.locale = :en : I18n.locale = :tl
        else
            I18n.locale = :en
        end
    end
end
