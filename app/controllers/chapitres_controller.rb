class ChapitresController < ApplicationController
  skip_filter :authenticate_user, only: [:welcome]

  def show
    @chapitre = Chapitre.find(params[:id])
    @users = User.all
    @ressource = Ressource.new
    @chapitre_feedbacks = @chapitre.ressources.map(&:feedback).compact
  end
end
