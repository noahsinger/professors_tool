class ExamplesController < ApplicationController
  protect_from_forgery :except => :echo
  
  before_filter :load_section, :except => [:test_notice, :test_error, :test_exception, :test_tweet]
  
  def load_section
   xxx@xxx.xxx = Section.find params[:section_id]
  end
  
  def index
    @examples xxx@xxx.xxx
  end
  
  def test_exception
    raise "Boom!"
  end
  
  def test_notice
    flash[:notice] = 'This is a test flash notice message.'
    redirect_to semesters_path
  end
  
  def test_error
    flash[:error] = 'This is an example of a flash error'
    redirect_to semesters_path
  end
  
  def test_tweet
    begin
      # Initialize Twitter client
  		client ||= Twitter::Client.new
      
      client.update( "Test Tweet" )
      flash[:notice] = "Tweet tweeted"
    rescue Twitter::Error => e
      flash[:error] = "Tweet not sent: #{e}"
    end
    redirect_to root_url
  end
  
  def echo
    
  end
end
