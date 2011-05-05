require 'test_helper'
require 'exception_notifier_helper'

class ExceptionNotifierHelperTest < Test::Unit::TestCase

  class ExceptionNotifierHelperIncludeTarget
    include ExceptionNotifierHelper
  end

  def setup
   xxx@xxx.xxx = ExceptionNotifierHelperIncludeTarget.new
  end

  # No controller
  
  def test_should_not_exclude_raw_post_parameters_if_no_controller
    assert xxx@xxx.xxx
  end
  
  # Controller, no filtering
  
  class ControllerWithoutFilterParameters; end

  def test_should_not_filter_env_values_for_raw_post_data_keys_if_controller_can_not_filter_parameters
    stub_controller(ControllerWithoutFilterParameters.new)
    xxx@xxx.xxx "secret").include?("secret")
  end
  def test_should_not_exclude_raw_post_parameters_if_controller_can_not_filter_parameters
    stub_controller(ControllerWithoutFilterParameters.new)
    assert xxx@xxx.xxx    
  end
  def test_should_return_params_if_controller_can_not_filter_parameters
    stub_controller(ControllerWithoutFilterParameters.new)
    assert_equal xxx@xxx.xxx
  end

  # Controller with filtering

  class ControllerWithFilterParameters
    def filter_parameters(params); :filtered end
  end

  def test_should_filter_env_values_for_raw_post_data_keys_if_controller_can_filter_parameters
    stub_controller(ControllerWithFilterParameters.new)
    assert xxx@xxx.xxx "secret").include?("secret")
    xxx@xxx.xxx "secret").include?("secret")
  end
  def test_should_exclude_raw_post_parameters_if_controller_can_filter_parameters
    stub_controller(ControllerWithFilterParameters.new)
    xxx@xxx.xxx
  end
  def test_should_delegate_param_filtering_to_controller_if_controller_can_filter_parameters
    stub_controller(ControllerWithFilterParameters.new)
    assert_equal xxx@xxx.xxx
  end
  
  private
    def stub_controller(controller)
     xxx@xxx.xxx controller)
    end
end
