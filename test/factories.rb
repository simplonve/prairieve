FactoryGirl.define do
    sequence :name do |n|
    "name-#{n}"
  end

  sequence :email do |n|
    "people#{n}@gmail.net"
  end

  factory :ressource do
    title "Declaration du Cyberespace"
    url "http://editions-hache.com/essais/barlow/barlow2.html"
    lang "en"
    level "green"
    time 10
    desc 'wow'
    tags 'plein, de, tags'
    categorie 'lecture'
    media 'article'
    feedback true
    user_id 1
  end

  factory :chapitre do
    title "foo"
    desc "bar"
    ressources {|ressources| [ressources.association(:ressource)]}
  end

  factory :activite do
    title "foo"
    desc "bar"
  end

  factory :question do
    desc "bar"
    valide ""
  end

  factory :user do
    password 'foo'
    password_confirmation 'foo'
    email { generate(:email) }
    name { generate(:name) }
  end
end


