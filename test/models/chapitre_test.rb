require 'test_helper'

class ChapitreTest < ActiveSupport::TestCase
  test "have a valid factory" do
    assert FactoryGirl.build(:chapitre).valid?
  end
end