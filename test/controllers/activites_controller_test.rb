require 'test_helper'

class ActivitesControllerTest < ActionController::TestCase
  def test_index
    activite = FactoryGirl.create(:activite)
    user = FactoryGirl.create(:user, id: 1)
    session[:user_id] = user.id

    get :index
    assert :success
  end
end
