require 'tweet'

class ExamplesController < ApplicationController
  protect_from_forgery except: :echo

  before_action :load_section, except: [:test_notice, :test_error, :test_exception, :test_tweet, :echo]

  def load_section
    @semester = Semester.find params[:semester_id]
    @section = Section.find params[:section_id]
  end

  def index
    @examples = @section.examples.all
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
      Tweet.new.send( "New test    tweet" )
      flash[:notice] = "Tweet tweeted"
    rescue Twitter::Error => e
      flash[:error] = "Tweet not sent: #{e}"
    end
    redirect_to root_url
  end

  def echo

  end
end
