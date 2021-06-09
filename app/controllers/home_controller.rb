class HomeController < ApplicationController
  before_action :authenticate_user!, only: [ :dashboard ]

  def index
  end

  def dashboard
    @tasks = current_user.tasks.in_progress
    @completed_tasks = current_user.tasks.completed
    @total_tasks = current_user.tasks
    @overdue = current_user.tasks.less_than_today.in_progress
    # user.tasks.where("deadline < ?", date_today).where(status: "in_progress")
    
    @today = DateTime.current.beginning_of_day.strftime("%-d %B %Y, %A")
    @page_title = "Welcome, #{current_user.first_name}"
  end

  def dummy
    @all_tasks = Task.all
  end
end