require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "users exist" do
    assert_equal 1, User.count
  end
  
  test "password accessor returns blank" do
    assert_equal '', User.first.password
  end
  
  test "valid users can be authenticated" do
    User.create( :username => 'user', :password => 'test' )
    assert_nothing_raised(RuntimeError) do 
      assert_not_nil User.authenticate( 'user', 'test' )
    end
  end
  
  test "invalid users cannot be authenticated" do
    User.create( :username => 'user', :password => 'test' )

    assert_raise(RuntimeError) do 
      assert_nil User.authenticate( 'user', 'bad' )
    end
  end
end
