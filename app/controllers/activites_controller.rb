class ActivitesController < ApplicationController
  skip_filter :authenticate_user, only: [:welcome]
  before_action :current_user, only: [:new, :create, :show]

  def show
    @activites = Activite.all
  end
  
  private
  def activite_params
    params.require(:activite).permit(:title, :desc, :chapitre, :user_id)
  end
end