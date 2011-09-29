require 'test_helper'

class DynamicFormI18nTest < Test::Unit::TestCase
  include ActionView::Context
  include ActionView::Helpers::DynamicForm

  attr_reader :request

  def setup
   xxx@xxx.xxx = stub :errors => stub(:count => 1, :full_messages => ['full_messages'])
    @object.stubs :to_model xxx@xxx.xxx
   xxx@xxx.xxx :class => stub(:model_name => stub(:human => ""))

   xxx@xxx.xxx = 'book_seller'
   xxx@xxx.xxx = 'book seller'

    stubs(:content_tag).returns 'content_tag'

    I18n.stubs(:t).with(:'header', :locale => 'en', :scope => [:errors, :template], :count => 1, :model => '').returns "1 error prohibited this  from being saved"
    I18n.stubs(:t).with(:'body', :locale => 'en', :scope => [:errors, :template]).returns 'There were problems with the following fields:'
  end

  def test_error_messages_for_given_a_header_option_it_does_not_translate_header_message
    I18n.expects(:t).with(:'header', :locale => 'en', :scope => [:errors, :template], :count => 1, :model => '').never
    error_messages_for(:object xxx@xxx.xxx :header_message => 'header message', :locale => 'en')
  end

  def test_error_messages_for_given_no_header_option_it_translates_header_message
    I18n.expects(:t).with(:'header', :locale => 'en', :scope => [:errors, :template], :count => 1, :model => '').returns 'header message'
    error_messages_for(:object xxx@xxx.xxx :locale => 'en')
  end

  def test_error_messages_for_given_a_message_option_it_does_not_translate_message
    I18n.expects(:t).with(:'body', :locale => 'en', :scope => [:errors, :template]).never
    error_messages_for(:object xxx@xxx.xxx :message => 'message', :locale => 'en')
  end

  def test_error_messages_for_given_no_message_option_it_translates_message
    I18n.expects(:t).with(:'body', :locale => 'en', :scope => [:errors, :template]).returns 'There were problems with the following fields:'
    error_messages_for(:object xxx@xxx.xxx :locale => 'en')
  end
end
