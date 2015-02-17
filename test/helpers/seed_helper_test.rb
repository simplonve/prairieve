require 'test_helper'

class SeedHelperTest < ActionView::TestCase
  def test_json_parser
    jsonfile = 'db/chapitres.json'
    datas = parse_json(jsonfile)

    assert datas[0][:title] != ''
  end
end