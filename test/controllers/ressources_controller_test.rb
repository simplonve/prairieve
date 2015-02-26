require 'test_helper'

class RessourcesControllerTest < ActionController::TestCase
  include ApplicationHelper 
  def setup
    @user = FactoryGirl.create(:user)
    @ressource = FactoryGirl.create(:ressource)
    session[:user_id] = @user.id
  end

  test "show" do
    assert @ressource.valid?
    get :show, id: @ressource.id
    assert_not_nil assigns(:ressource)
    assert_redirected_to @ressource.url
  end

  test "ahoy event" do
    get :show, id: @ressource.id
    assert_equal @user.id, Ahoy::Event.last.user_id
  end
  
  test "pie_chart" do
    get :show, id: @ressource.id
    assert_equal 1, pie_chart_helper['Declaration du Cyberespace']
  end
end
