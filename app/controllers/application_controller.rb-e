class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def authenticate  
  	if session[:authentication_bypass]
  		session[:authentication_bypass] = nil
	  else
	    unless current_user
	      redirect_to login_path
	    end
	  end
  end
  
  private

    def current_user
     xxx@xxx.xxx ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user
    
    def css_naked_day?
    	# is it CSS naked day?
			Date.today.day == 9 and Date.today.month == 4
    end
    
    helper_method :css_naked_day?
end
