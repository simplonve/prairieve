require 'test_helper'

class ChapitreTest < ActiveSupport::TestCase
  test "have a valid factory" do
    assert FactoryGirl.build(:chapitre).valid?
  end

  test "validates uniqueness of chapitre" do
    chapitre_in_db = FactoryGirl.create(:chapitre, title: "foo")
    new_chapitre = Chapitre.new(title: chapitre_in_db.title)

    assert_equal false, new_chapitre.save
  end
end