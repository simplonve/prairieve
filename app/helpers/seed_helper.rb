module SeedHelper
  def parse_json(jsonfile)
    JSON.parse(File.read(jsonfile))
  end
end