class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # def markdown(text)
  #   options = {:hard_wrap => true, :autolink => true, :no_intraemphasis => true, :fenced_code => true, :gh_blockcode => true, :fenced_code_blocks => true}
  #   markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
  #   markdown.render(coderay( text )).html_safe
  # end
  # 
  # def coderay(text)
  #   text.gsub( /```(.+?)\s(.+?)```/m ) do |s|
  #     CodeRay.scan($2, $1.to_sym).div(:css => :class)
  #   end
  # end
  # 
  # helper_method :markdown
    
  def authenticate
#   	logger.info("**************************")
# 		logger.info("COOKIES:")
# 		cookies.each do |name,value|
# 			logger.info("Name: #{name}")
# 			logger.info("Value: #{value}")
# 			logger.info("------------------------")
# 		end
# 		logger.info("**************************")
  
  	if session[:authentication_bypass]
  		session[:authentication_bypass] = nil
	  else
	    unless current_user
	      # session[:intended_action] = action_name
	      # session[:intended_controller] = controller_name
	      # session[:intended_id] = params[:id]
	      redirect_to login_path
	      
# 	      respond_to do |format|
# 					format.html {redirect_to login_path}
# 					format.js {render :template => 'sessions/isotope_new'}
# 				end
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
