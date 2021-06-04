class HomeController < ApplicationController
  before_action :authenticate_user!, only: [ :dashboard ]

  def index
  end

  def dashboard
    @tasks = current_user.tasks.in_progress
    @today = DateTime.current.beginning_of_day.strftime("%-d %B %Y, %A")
    @page_title = "Welcome, #{current_user.first_name}"
  end
end