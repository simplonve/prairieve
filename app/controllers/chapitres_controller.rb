class ChapitresController < ApplicationController
  skip_filter :authenticate_user, only: [:welcome]


  def index
    @chapitres = Chapitre.all
  end

  def show
    @chapitre = Chapitre.find(params[:id])
  end

  def welcome
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['LOGUSR'] && password == ENV['LOGPWD']  
    end
  end
end
