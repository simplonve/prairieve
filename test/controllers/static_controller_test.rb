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

  def test_assign
    user = FactoryGirl.create(:user)
    activite = FactoryGirl.create(:activite)
    session[:user_id] = user.id
    patch :assign, activites: activite.id, user: {user_id: user.id}

    activite.reload
    assert user.activites.includes(activite)
  end

  def test_validation
    user = FactoryGirl.create(:user)
    session[:user_id] = user.id
    question = FactoryGirl.create(:question)
    post :validation, id: question.id, question: {question_id: question.id}

    question.reload
    assert question.already_valid(user), "Question.valide : #{question.valide}"
  end
end
