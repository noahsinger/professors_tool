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
    unless current_user
      # session[:intended_action] = action_name
      # session[:intended_controller] = controller_name
      # session[:intended_id] = params[:id]
      redirect_to login_path
    end
  end
  
  private

    def current_user
     xxx@xxx.xxx ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user
end
