module ApplicationHelper
  def display_lang(obj)
    case obj.lang
    when 'en' then "#{image_tag 'uk.png', size: '20x20'}"
    when 'fr' then "#{image_tag 'fr.png', size: '20x20'}"
    end
  end

  def display_level(obj)
    case obj.level
    when 'verte' then "<div class='label piste_verte'> verte </div>"
    when 'bleue' then "<div class='label piste_bleue'> bleue </div>"
    when 'rouge' then "<div class='label piste_rouge'> rouge </div>"
    when 'noire' then "<div class='label piste_noire'> noire </div>"
    end
  end

  def find_ressource(id)
    Ressource.find(id.to_i).title
  end

  def days_ago(time)
    day_int = Time.now.day- time.day
    day_int.day.ago.midnight.to_i
  end

  def pie_chart_helper
    ress_titles = Ahoy::Event.ressources_clicked
                             .today
                             .map{|event| event.properties["ressource_id"]}
                             .map{|id| find_ressource(id)}
    generate_hash(ress_titles)
  end


  def line_chart_helper
    datetime_of_clicks = Ahoy::Event.ressources_clicked
                                    .last_7_days
                                    .map{|event| days_ago(event.time)}
    
    generate_hash(datetime_of_clicks)
  end

  def generate_hash(ary)
    hash = Hash.new do |hash, key|
        hash[key] = 0
    end 

    ary.each do |entry|
      hash[entry] += 1
    end

    hash
  end
end
