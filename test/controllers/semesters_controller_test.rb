require 'test_helper'

class SemestersControllerTest < ActionDispatch::IntegrationTest
  test "should_get_index" do
    get semesters_url
    assert_response :success
    assert_not_nil assigns(:semesters)
  end

  test "current shows all semesters if there is no current or future semesters" do
    Semester.destroy_all
    Semester.create year: Time.now.year, season: 'fall', start_date: 5.month.ago.to_date, end_date: 2.months.ago.to_date

    get current_semesters_url
    assert_response :success
  end

  test "current shows current semester if there is one" do
    Semester.destroy_all
    past = Semester.create year: Time.now.year, season: 'fall', start_date: 5.month.ago.to_date, end_date: 2.months.ago.to_date
    current = Semester.create year: Time.now.year, season: 'fall', start_date: 1.month.ago.to_date, end_date: 2.months.from_now.to_date
    future = Semester.create year: Time.now.year, season: 'fall', start_date: 2.month.from_now.to_date, end_date: 5.months.from_now.to_date

    get current_semesters_url
    assert_redirected_to semester_sections_url(current)
  end

  test "current shows next semester if there is one" do
    Semester.destroy_all
    past = Semester.create year: Time.now.year, season: 'fall', start_date: 5.month.ago.to_date, end_date: 2.months.ago.to_date
    future = Semester.create year: Time.now.year, season: 'fall', start_date: 2.month.from_now.to_date, end_date: 5.months.from_now.to_date

    get current_semesters_url
    assert_redirected_to semester_sections_url(future)
  end
end
