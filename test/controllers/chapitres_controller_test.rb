require 'test_helper'

class ChapitresControllerTest < ActionController::TestCase
  def test_show
    chapitre = FactoryGirl.create(:chapitre)
    user = FactoryGirl.create(:user)
    session[:user_id] = user.id

    get :show, id: chapitre.id
    assert :success
    assert_not_nil assigns(:chapitre)
  end
end
