require 'test_helper'

class ChapitresControllerTest < ActionController::TestCase
  def test_chapitre_has_ressources
    user = FactoryGirl.create(:user)
    session[:user_id] = user.id

    get :index
    assert_not_nil assigns(:chapitres)
  end

  def test_show
    chapitre = FactoryGirl.create(:chapitre)
    user = FactoryGirl.create(:user)
    session[:user_id] = user.id

    get :show, id: chapitre.id
    assert_not_nil assigns(:chapitre)
  end
end
