require 'test_helper'

class MaterialTest < ActiveSupport::TestCase
  test "materials exist" do
    assert_equal 1, Material.count
  end
end
