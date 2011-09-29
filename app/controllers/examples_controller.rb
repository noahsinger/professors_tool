class ExamplesController < ApplicationController
  protect_from_forgery :except => :echo
  
  def test_exception
    raise "Boom!"
  end
  
  def test_flash
    flash[:notice] = 'This is a test flash message.'
    redirect_to semester_section_assignments_path( Semester.current, Semester.current.sections.first )
  end
  
  def echo
    
  end
end
