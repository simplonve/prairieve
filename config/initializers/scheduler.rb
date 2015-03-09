include SeedHelper
require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new

ary_chapitres = parse_json('db/chapitres.json')

scheduler.at '2015-03-15 09:00:00 +0100' do      
  Chapitre.create_and_mail(ary_chapitres[1])
end

scheduler.at '2015-03-22 09:00:00 +0100' do
  Chapitre.create_and_mail(ary_chapitres[2])
end

scheduler.at '2015-03-29 09:00:00 +0100' do
  Chapitre.create_and_mail(ary_chapitres[3])
end

scheduler.at '2015-04-05 09:00:00 +0100' do      
  Chapitre.create_and_mail(ary_chapitres[4])
end

scheduler.at '2015-03-05 15:26:00 +0200' do
  puts "###############"
  puts "test scheduler on heroku production"
end
