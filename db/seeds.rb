include SeedHelper

parse_json('db/chapitres.json').each do |data|
  Chapitre.create(data)
end

parse_json('db/ressources.json').each do |data|
  Ressource.create(data)
end

User.create(name: 'Jean', email:"foo@bar.com", password:'azerty')
