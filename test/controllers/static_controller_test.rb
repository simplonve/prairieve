require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  def test_welcome
    get :welcome
  end

  def test_stat
    get :stat
    assert_not_nil assigns(:stat)
  end
end
