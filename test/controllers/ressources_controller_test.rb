require 'test_helper'

class RessourcesControllerTest < ActionController::TestCase

  def setup
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def login_as_admin
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("username","password")
  end

  def test_all_pages_for_admin_is_protected
    [:index].each do |action|
      get action
      assert_response :unauthorized
    end
  end

  def test_index_page_loads_upon_successful_login
    login_as_admin

    get :index

    assert_response :success
  end
end
