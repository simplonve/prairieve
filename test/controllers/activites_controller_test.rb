require 'test_helper'

class ActivitesControllerTest < ActionController::TestCase
  def test_index
    activite = FactoryGirl.create(:activite)
    user = FactoryGirl.create(:user, id: 1)
    session[:user_id] = user.id

<<<<<<< HEAD
    get :show, id: activite.id
=======
    get :index
>>>>>>> e19e455be074c8a3cbc702f0a0c11aaa5de47462
    assert :success
    assert_not_nil assigns(:activites)
  end
end
