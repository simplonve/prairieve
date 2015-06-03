require 'test_helper'

class ActiviteTest < ActiveSupport::TestCase
  test "have a valid factory" do
    assert FactoryGirl.build(:activite).valid?
  end

  test "assign activite to user" do
    activite = FactoryGirl.create(:activite)
    user = FactoryGirl.create(:user)
    user.assign(activite)
    assert_equal user.activites.first.id, activite.id
  end
end