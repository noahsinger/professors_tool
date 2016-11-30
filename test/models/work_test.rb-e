require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  test "works exist" do
    assert_equal 2, Work.count
  end
  
  test "works have a withdrawl code" do
    work = Work.first
    assert_respond_to Work.first, :generate_withdrawal_code
    work.generate_withdrawal_code
    assert_equal work.withdrawal_code, Digest::SHA256.hexdigest(work.assignment.title+work.assignment.lab.title+work.id.to_s)
  end
  
  test "works know if they're graded" do
    assert_respond_to Work.first, :graded?
    assert_equal true, Work.find(1).graded?
    assert_equal false, Work.find(2).graded?
  end
  
  test "works can find their score" do
    assert_respond_to Work.first, :score
    assert_equal 100, Work.find(1).score
  end
  
  test "works can give their scores as a percentage" do
    assert_respond_to Work.first, :percentage
    assert_equal 100, Work.find(1).percentage
  end
  
  test "works can send submitted email" do
    assert_respond_to Work.first, :send_submitted_email
    
    assert_difference('Delayed::Job.all.size') do
      Work.first.send_submitted_email xxx@xxx.xxx
    end
  end
  
  test "works can send remonder email" do
    assert_respond_to Work.first, :send_reminder_email
    
    assert_difference('Delayed::Job.all.size') do
      Work.first.send_reminder_email
    end
  end
end
