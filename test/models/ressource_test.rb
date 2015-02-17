require 'test_helper'

class RessourceTest < ActiveSupport::TestCase
  test "have a valid factory" do
    assert FactoryGirl.build(:ressource).valid?
  end

  test "validates uniqueness of ressource" do
    ressource_in_db = FactoryGirl.create(:ressource, title: "foo")
    new_ressource = Ressource.new(title: ressource_in_db.title)

    assert_equal false, new_ressource.save
  end
end