include SeedHelper

parse_json('db/ressources.json').each do |data|
  Ressource.create(data)
end

