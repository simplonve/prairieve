require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "sort hash" do
    hash = {foo: 1, bar: 3, baz: 2}
    ordered_hash = {foo: 1, baz: 2, bar: 3}
    assert_equal ordered_hash, sort_hash_by_values(hash)
  end
end
