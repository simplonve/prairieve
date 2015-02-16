require 'test_helper'

class RessourcesControllerTest < ActionController::TestCase
  def setup
    @request    = ActionController::TestRequest.new
  end

  def login_as_admin
    usr = ENV['USR']
    pwd = ENV['PWD']
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(usr, pwd)
  end

  def test_index_page_is_protected
    get :index
    assert_response :unauthorized
    
    login_as_admin
    get :index
    assert_response :success
  end
end
