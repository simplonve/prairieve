class RessourcesController < ApplicationController
  def show
    @ress = Ressource.find(params[:id])
    ahoy.track("Ressource clicked", user: current_user.id, ressource_id: @ress.id)
    redirect_to @ress.url
  end
end
