require 'test_helper'

class SyllabusPartTest < ActiveSupport::TestCase
  test "syllabus parts exist" do
    assert_equal 2, SyllabusPart.count
  end
end
