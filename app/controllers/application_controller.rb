class ApplicationController < ActionController::Base

    helper_method :current_user 

    def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    rescue ActiveRecord::RecordNotFound
        session[:user_id] = nil
        nil
    end 

    def require_user 
        redirect_to '/login' unless current_user 
    end
    
    def require_editor_or_admin
        redirect_to productos_bucket_path unless current_user && (current_user.editor? || current_user.admin?)
      end
      
      def require_admin
        redirect_to productos_bucket_path unless current_user && current_user.admin?
      end
      
      
end
