class RessourcesController < ApplicationController
  before_filter :authenticate

  def index
    @ressouces = Ressource.all
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['LOGUSR'] && password == ENV['LOGPWD']  
    end
  end
end
