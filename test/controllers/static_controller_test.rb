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

  def test_welcome
    get :monitor
    assert :success
  end

  def test_validation
    user = FactoryGirl.create(:user)
    session[:user_id] = user.id
    question = FactoryGirl.create(:question)
    post :validation, id: question.id, question: {question_id: question.id}

    assert_redirected_to user_path(user.id)
    question.reload
    assert question.already_valid(user), "Question.valide : #{question.valide}"
  end
end
