require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  fixtures :sections

  def test_create
    assert_equal Section.count, 5
  end
  
  def test_in_session
    assert_equal Section.find( 3 ).in_session, true
    assert_equal Section.find( 1 ).in_session, false
  end
end
