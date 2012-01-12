class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # before_filter :adjust_format_for_iphone

  def markdown(text)
    options = [:hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    Redcarpet.new(text, *options).to_html.html_safe
  end
  
  helper_method :markdown
    
  def call_rake( task, options = {} )
    options[:rails_env] ||= Rails.env
    args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
    system APP_CONFIG['rake_path'] + " --trace #{task} #{args.join(' ')} 2>&1 >> #{Rails.root}/log/rake.log &"
  end
  
  # def check_authentication
  def authenticate
    unless session[:user]
      session[:intended_action] = action_name
      session[:intended_controller] = controller_name
      session[:intended_id] = params[:id]
      redirect_to signin_admin_admin_index_path
    end
  end

  def signin
    if request.post?
      begin
        session[:user] = User.authenticate( params[:user][:username], params[:user][:password] ).id
        redirect_to :action => session[:intended_action], :controller => session[:intended_controller], :id => session[:intended_id]
      rescue
        flash[:error] = "Your username or password are incorrect"
      end
    end
  end

  def signout
    session[:user] = nil
    redirect_to root_path
  end
  
  private
    def adjust_format_for_iphone
      if request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(iPhone|iPod)/]
        request.format = :iphone
      end
    end
end
