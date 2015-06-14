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
  
  def validation
    question = Question.find(valide_params[:question_id])
    attr_valide = question.valide + ' ' + current_user.id.to_s
    question.valide = attr_valide
    question.save!
    redirect_to user_path(current_user.id) + "#activite#{question.activite_id}"
  end
  
  private
  def activite_params
    params.require(:user).permit(:activites, :user_id)
  end

  def valide_params
    params.require(:question).permit(:question_id)
  end

  def require_admin
    unless current_user.admin?
      flash[:error] = "Vous devez être un administrateur pour acceder à cette section"
      redirect_to root_path
    end
  end
end
