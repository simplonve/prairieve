include SeedHelper

parse_json('db/activites.json').each do |data|
  @activite = Activite.new
  @activite.chapitre = data["chapitre"]
  @activite.title =    data["title"]
  @activite.desc =     data["desc"]
  @activite.save

  data["questions"].each do |desc_question|
    q = Question.new
    q.desc = desc_question
    q.activite_id = @activite.id
    q.save 
  end
end

parse_json('db/ressources.json').each do |data|
  Ressource.create(data)
end

