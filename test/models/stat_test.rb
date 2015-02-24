require 'test_helper'

class StatTest < ActiveSupport::TestCase
  test "invalid without trace" do
    stat = Stat.new
    assert stat.invalid?, 'Invalid without trace'
    stat.trace = 'a trace'
    assert stat.valid?, 'Valid with trace'
  end

  test "create_for user & ressource" do
    user = FactoryGirl.create(:user)
    ressource = FactoryGirl.create(:ressource)
    Stat.create_for(user, ressource)
    trace = {user_id: user.id, user: user.name, ressource_id: ressource.id, ressource: ressource.title}
    assert_equal JSON.generate(trace), Stat.first.trace
  end
end
