require 'test_helper'

class RessourceTest < ActiveSupport::TestCase
  test "have a valid factory" do
    assert FactoryGirl.build(:ressource).valid?
  end
end