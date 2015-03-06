require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "valid factory" do
    assert FactoryGirl.build(:user).valid?
  end

  test "invalid without name or password" do
    assert FactoryGirl.build(:user, name: nil).invalid?
    assert FactoryGirl.build(:user, password: nil).invalid?
  end

  test "password digest" do
    user = FactoryGirl.create(:user, password: 'something clear', password_confirmation: 'something clear')
    assert_not_equal 'something clear', user.password_digest
  end

  test "check email and password on login" do
    user = FactoryGirl.create(:user, password: 'something', password_confirmation: 'something')
    assert_equal user, User.find_by(email: user.email).authenticate('something')
    assert User.login(user.email, 'something'), 'login with email and password fail'
  end

  test "generate reset_password_key!" do
    user = FactoryGirl.create(:user, reset_password_key: nil)
    user.generate_reset_password_key!
    assert_not_nil user.reset_password_key
  end

  test "reset_password" do
    user = FactoryGirl.create(:user, reset_password_key: nil)
    User.reset_password(user.email)
    assert_not_nil user.reload.reset_password_key
  end

  test "update_password" do
    user = FactoryGirl.create(:user, reset_password_key: 'ert')
    user.update_password('truc', 'truc')
    assert_nil user.reload.reset_password_key
    assert user.authenticate('truc')
  end

  test "inscription" do
    assert_nil User.find_by(email: 'an@email.net')
    result = User.inscription('an@email.net')
    assert_kind_of User, result
    user = User.find_by(email: 'an@email.net')
    assert_not_nil user.reset_password_key
  end
end