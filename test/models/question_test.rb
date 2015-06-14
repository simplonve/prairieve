require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "have a valid factory" do
    assert FactoryGirl.build(:question).valid?
  end
  test "is question already_valid " do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, valide: " #{user.id}")
    assert question.already_valid(user)
  end
end