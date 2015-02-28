class ChapitresController < ApplicationController
  skip_filter :authenticate_user, only: [:welcome]

  def index
    @chapitres = Chapitre.all
    @users = User.all
    @ressource = Ressource.new
  end

  def show
    @chapitre = Chapitre.find(params[:id])
  end
end
