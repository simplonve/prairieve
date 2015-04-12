class StaticController < ApplicationController
  include ApplicationHelper 
  skip_filter :authenticate_user, only: [:welcome]
  skip_filter :current_user, only: [:welcome]
  before_action :require_admin, only: [:monitor, :stat]

  def stat
    @today_pie_chart = today_pie_chart_hash
    @week_line_chart = week_line_chart_hash
    @month_line_chart = month_line_chart_hash
    @popular_ressources_chart = popular_ressources_hash
    @user_clicks_chart = user_clicks_table_hash
  end

  def welcome
    @chapitres = Chapitre.order("title")
  end

  def monitor
    @users = User.all
    @activite = Activite.all
  end

  def assign
    activite = Activite.find(activite_params[:activites])
    @user = User.find(activite_params[:user_id])
    @user.assign(activite) 
    redirect_to monitor_path
  end
  
  private
  def activite_params
    params.require(:user).permit(:activites, :user_id)
  end

  def require_admin
    unless current_user.admin?
      flash[:error] = "Vous devez être un administrateur pour acceder à cette section"
      redirect_to root_path
    end
  end
end
