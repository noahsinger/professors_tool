# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'f86d569031118db1e222576e56525688'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  # def authenticate
    # flash[:notice] = "you've been authenticated (replace me in admin/application.rb with real authentication please)"
    # flash[:notice] = "rejecting everyone!"
    # redirect_to( :controller => "/sections", :action => 'index', :semester_id => Semester.current.id )
    
    # authenticate_or_request_with_http_basic do |username, password|
        # username == APP_CONFIG['auser'] && password == APP_CONFIG['apass']
    # end
  # end
  
  before_filter :adjust_format_for_iphone
    
  def call_rake( task, options = {} )
    options[:rails_env] ||= Rails.env
    args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
    # system "/usr/local/bin/rake --trace #{task} #{args.join(' ')} 2>&1 >> #{Rails.root}/log/rake.log &"
    system APP_CONFIG['rake_path'] + " --trace #{task} #{args.join(' ')} 2>&1 >> #{Rails.root}/log/rake.log &"
  end
  
  # def check_authentication
  def authenticate
    unless session[:user]
      session[:intended_action] = action_name
      session[:intended_controller] = controller_name
      session[:intended_id] = params[:id]
      # redirect_to :controller => '/admin', :action => 'signin'
      redirect_to signin_admin_admin_path
    end
  end

  def signin
    if request.post?
      begin
        session[:user] = User.authenticate( params[:user][:username], params[:user][:password] ).id
        redirect_to :action => session[:intended_action], :controller => session[:intended_controller], :id => session[:intended_id]
      rescue
        flash[:notice] = "Your username or password are incorrect"
      end
    end
  end

  def signout
    session[:user] = nil
    redirect_to :controller => '/'
  end
  
  private
    def adjust_format_for_iphone
      if request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(iPhone|iPod)/]
        request.format = :iphone
      end
    end
  
end
