require 'test_helper'

class RessourcesControllerTest < ActionController::TestCase
  def login_as_admin
    # Every ENV['FOO'] should be available in a file called .env at the root of the app
    # Syntax example of the .env file
    #   FOO=bar
    # in order to serve "bar" as a string
    usr = ENV['LOGUSR']
    pwd = ENV['LOGPWD']
    
    # request is a method included is any Controller test
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(usr, pwd)
  end

  def test_index_page_is_protected
    get :index
    assert_response :unauthorized
    
    login_as_admin
    get :index
    assert_response :success
  end

  def test_chapitre_has_ressources
    login_as_admin
    chapitre = FactoryGirl.create(:chapitre)
    ressource = FactoryGirl.create(:ressource, chapitre_id: 1)
    get :index
    assert_not_nil assigns(:chapitres)

    assert_equal 1, chapitre.ressources.first.id
  end
end
