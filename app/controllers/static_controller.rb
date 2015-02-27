
class StaticController < ApplicationController
  include ApplicationHelper 
  skip_filter :authenticate_user, only: [:welcome]
  skip_filter :current_user, only: [:welcome]

  def stat
    @today_pie_chart = today_pie_chart_hash
    @week_line_chart = week_line_chart_hash
    @month_line_chart = month_line_chart_hash
    @popular_ressources_chart = popular_ressources_hash
    @user_clicks_chart = user_clicks_table_hash
  end

  def welcome
  end
end
