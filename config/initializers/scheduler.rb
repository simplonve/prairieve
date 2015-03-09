include SeedHelper
require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new

ary_chapitres = parse_json('db/chapitres.json')

scheduler.at '2015-03-16 05:00:00' do      
  Chapitre.create_and_mail(ary_chapitres[1])
end

scheduler.at '2015-03-23 05:00:00' do
  Chapitre.create_and_mail(ary_chapitres[2])
end

scheduler.at '2015-03-30 05:00:00' do
  Chapitre.create_and_mail(ary_chapitres[3])
end

scheduler.at '2015-04-06 05:00:00' do      
  Chapitre.create_and_mail(ary_chapitres[4])
end
