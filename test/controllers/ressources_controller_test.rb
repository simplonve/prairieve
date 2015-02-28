require 'test_helper'

class RessourcesControllerTest < ActionController::TestCase
  include ApplicationHelper 
  def setup
    @user = FactoryGirl.create(:user)
    @ressource = FactoryGirl.create(:ressource)
    @chapitre = FactoryGirl.create(:chapitre, ressources: [@ressource])
    session[:user_id] = @user.id
  end

  test "invalid without url" do
    assert FactoryGirl.build(:ressource, url: nil).invalid?
  end

  test "title uniqueness" do
    assert FactoryGirl.build(:ressource, title: nil).invalid?
  end

  test "show" do
    assert @ressource.valid?
    get :show, id: @ressource.id, chapitre_id: @chapitre
    assert_not_nil assigns(:ressource)
    assert_redirected_to @ressource.url
  end

  test "new ressource feedback" do
    get :new, chapitre_id: @chapitre
    assert_equal @chapitre, assigns(:chapitre)
    assert_equal true, @ressource.feedback
  end

  test "create ressource feedback" do
    post :create, chapitre_id: @chapitre, ressource: {url: @ressource.url}
    ressource_created = @chapitre.ressources.first
    assert_equal @ressource.url, ressource_created.url
    assert_equal true, ressource_created.feedback
    assert_redirected_to root_url
  end

  test "ahoy event" do
    get :show, id: @ressource.id, chapitre_id: @chapitre
    assert_equal @user.id, Ahoy::Event.last.user_id
  end
  
  test "pie_chart" do
    get :show, id: @ressource.id, chapitre_id: @chapitre
    assert_equal 1, today_pie_chart_hash['Declaration du Cyberespace']
  end

  test "line_chart" do
    get :show, id: @ressource.id, chapitre_id: @chapitre
    midnight_today = (Time.now.midnight + 2.hours).to_i
    assert_equal midnight_today, week_line_chart_hash.keys.first
  end
end
