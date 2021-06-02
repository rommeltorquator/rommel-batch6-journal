class HomeController < ApplicationController
  def index
  end

  def dashboard
    @tasks = current_user.tasks
  end
end
