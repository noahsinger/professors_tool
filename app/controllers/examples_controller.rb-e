class ExamplesController < ApplicationController
  protect_from_forgery :except => :echo
  
  before_filter :load_section, :except => [:test_notice, :test_error, :test_exception]
  
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
    # redirect_to root_url
    redirect_to semesters_path
  end
  
  def test_error
    flash[:error] = 'This is an example of a flash error'
    redirect_to semesters_path
  end
  
  def echo
    
  end
end
