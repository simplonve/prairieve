class RessourcesController < ApplicationController
  def show
    @ress = Ressource.find(params[:id])
    Stat.create_for(current_user, @ress)
    redirect_to @ress.url
  end
end
