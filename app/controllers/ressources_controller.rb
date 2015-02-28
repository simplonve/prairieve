class RessourcesController < ApplicationController
  def show
    @ressource = Ressource.find(params[:id])
    ahoy.track("Ressource clicked", ressource_id: @ressource.id)
    redirect_to @ressource.url
  end

  def new
    @ressource = Ressource.new
    @chapitre = Chapitre.find(params[:chapitre_id])
  end

  def create
    chapitre = Chapitre.find(params[:chapitre_id])
    new_ressource          = chapitre.ressources.new(ressource_params)
    new_ressource.feedback = true
    new_ressource.user_id  = current_user.id

    if new_ressource.save
      redirect_to chapitre_path(chapitre.id), notice: t('feedbackthx')
    else
      flash[:error] = t('feedbackerror')
      redirect_to new_chapitre_ressource_path(chapitre.id)
    end
  end

  private

  def ressource_params
    params.require(:ressource).permit(:title, :url, :lang, :level, :time, :chapitre_id, :desc, :tags, :categorie, :media, :feedback, :user_id)
  end
end
