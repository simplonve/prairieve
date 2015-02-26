require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  def test_welcome
    get :welcome
    assert :success
  end

  def test_stat
    get :stat
    assert :success
  end
end
