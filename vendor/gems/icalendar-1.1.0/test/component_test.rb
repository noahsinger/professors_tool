$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'date'
require 'test/unit'
require 'icalendar'

class TestComponent < Test::Unit::TestCase

  # Create a calendar with an event for each test.
  def setup
   xxx@xxx.xxx = Icalendar::Calendar.new
   xxx@xxx.xxx = Icalendar::Event.new
  end

  def test_add_remove_component
   xxx@xxx.xxx
    xxx@xxx.xxx
   xxx@xxx.xxx
    xxx@xxx.xxx
  end

  def test_ical_property
    # No alias but it does have a prop_name
    xxx@xxx.xxx
   xxx@xxx.xxx = "PRIVATE"
    xxx@xxx.xxx
    xxx@xxx.xxx

    # Check that both dtend and its alias start work correctly
    date = DateTime.new(2005, 02, 05, 23, 24, 25)
   xxx@xxx.xxx = date
    xxx@xxx.xxx

    date2 =  DateTime.new(2005, 02, 05, 23, 24, 26)
   xxx@xxx.xxx = date2
    xxx@xxx.xxx
  end

  def test_ical_multi_property
    # Query
    xxx@xxx.xxx
   xxx@xxx.xxx = []
    xxx@xxx.xxx

    # Should return an empty array, rather than nil
    xxx@xxx.xxx

    # Add and remove
   xxx@xxx.xxx "c1"
   xxx@xxx.xxx "c2"
    xxx@xxx.xxx
    xxx@xxx.xxx
   xxx@xxx.xxx "c1"
    xxx@xxx.xxx

    # Set & get whole array
    foo = ["as", "df"]
   xxx@xxx.xxx = foo
    xxx@xxx.xxx
  end

  def test_x_property
   xxx@xxx.xxx = "my-custom-property"
    xxx@xxx.xxx
  end
end
