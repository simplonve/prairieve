require 'test_helper'

class StatTest < ActiveSupport::TestCase
  def setup
    @user = FactoryGirl.create(:user)
    @ressource = FactoryGirl.create(:ressource)
  end

  test "invalid without trace" do
    stat = Stat.new
    assert stat.invalid?, 'Invalid without trace'
    stat.trace = 'a trace'
    assert stat.valid?, 'Valid with trace'
  end

  test "create_for user & ressource" do
    Stat.create_for(@user, @ressource)

    trace = {user_id: @user.id, user: @user.name, ressource_id: @ressource.id, ressource: @ressource.title}
    assert_equal JSON.generate(trace), Stat.first.trace
  end

  test 'view stats' do
    Stat.create_for(@user, @ressource)
    stat = Stat.ress_view_counter
    assert_equal 1, stat[@ressource.id]
    
    Stat.create_for(@user, @ressource)
    stat = Stat.ress_view_counter
    assert_equal 2, stat[@ressource.id]
  end

  test 'last views' do
    Stat.create_for(@user, @ressource)

  end
end
