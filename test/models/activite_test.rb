require 'test_helper'

class ActiviteTest < ActiveSupport::TestCase
  test "have a valid factory" do
    assert FactoryGirl.build(:activite).valid?
  end
end