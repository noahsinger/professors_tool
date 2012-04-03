class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def markdown(text)
    options = {:hard_wrap => true, :autolink => true, :no_intraemphasis => true, :fenced_code => true, :gh_blockcode => true, :fenced_code_blocks => true}
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    # markdown.render(text).html_safe
    coderay(markdown.render(text).html_safe).html_safe
  end
  
  def coderay(text)
    text.gsub( /\<code(\ class=\"(.+?)\")?\>(.+?)\<\/code\>/m ) do |s|
      CodeRay.scan($3, $2).div(:css => :class)
      "x#{$3}x"
    end
  end
  
  helper_method :markdown
    
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
