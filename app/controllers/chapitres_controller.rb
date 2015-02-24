class ChapitresController < ApplicationController
  skip_filter :authenticate_user, only: [:welcome]

  def index
    @chapitres = Chapitre.all
  end

  def show
    @chapitre = Chapitre.find(params[:id])
  end
end
