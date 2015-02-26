class RessourcesController < ApplicationController
  def show
    @ressource = Ressource.find(params[:id])
    ahoy.track("Ressource clicked", ressource_id: @ressource.id)
    redirect_to @ressource.url
  end
end
