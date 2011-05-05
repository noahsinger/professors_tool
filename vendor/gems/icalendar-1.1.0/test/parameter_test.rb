# Test out property parameter functionality
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

   def test_property_parameters
     params = {"ALTREP" =>['"http://my.language.net"'], "LANGUAGE" => ["SPANISH"]}
     xxx@xxx.xxx is a test summary.", params)

      assert_equal xxx@xxx.xxx

     xxx@xxx.xxx @event
      cal_str xxx@xxx.xxx

      cals = Icalendar::Parser.new(cal_str).parse
      event = cals.first.events.first
      assert_equal params, event.summary.ical_params
   end
end
