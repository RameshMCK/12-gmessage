class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
     
  protect_from_forgery with: :exception
  before_action :get_user
  
  
private    

    def get_user
        @user = current_user
        @is_logged_in = user_signed_in?
      end
    
      def auth_user
        redirect_to root_url if !@is_logged_in
      end
      
    def configure_permitted_parameters
        #devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password , :photo , :color])
        devise_parameter_sanitizer.permit(:account_update, keys: [:photo , :color])
        
    end
end
