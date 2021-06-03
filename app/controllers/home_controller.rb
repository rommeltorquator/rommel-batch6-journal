class HomeController < ApplicationController
  def index
  end

  def dashboard
    @tasks = current_user.tasks.in_progress
  end
end
