
class StaticController < ApplicationController
  include ApplicationHelper 
  skip_filter :authenticate_user, only: [:welcome]
  skip_filter :current_user, only: [:welcome]

  def stat
    @pie_chart = pie_chart_helper
    @line_chart = line_chart_helper
  end

  def welcome
  end
end
