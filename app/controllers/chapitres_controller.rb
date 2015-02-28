class ChapitresController < ApplicationController
  skip_filter :authenticate_user, only: [:welcome]

  def show
    @chapitre = Chapitre.find(params[:id])
    @users = User.all
    @ressource = Ressource.new
  end
end
