class Admin::AdminController < ApplicationController
  before_action :authenticate, except: :signin
  
  def index
    @semesters = Semester.order('start_date desc').limit(5)
  end
end
