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
    assert_equal 1, today_pie_chart_hash['Declaration du Cyberespace']
  end

  test "line_chart" do
    get :show, id: @ressource.id
    midnight_today = (Time.now.midnight + 2.hours).to_i
    assert_equal midnight_today, week_line_chart_hash.keys.first
  end
end
