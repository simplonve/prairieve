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

  def days_ago(time)
    day_int = Time.now.day- time.day
    day_int.day.ago.midnight.to_i
  end

  def ressources_clicked
    Ahoy::Event.ressources_clicked
  end
  
  def today_pie_chart_hash
    today_titles = ressources_clicked.today
                                     .map{|event| event.properties["ressource_id"] }
                                     .map{|id| Ressource.find(id.to_i).title}
    generate_hash(today_titles)
  end

  def week_line_chart_hash
    datetime_of_clicks = ressources_clicked.last_7_days
                                           .map{|event| days_ago(event.time)}
    generate_hash(datetime_of_clicks)
  end

  def month_line_chart_hash
    datetime_of_clicks = ressources_clicked.last_30_days
                                           .map{|event| days_ago(event.time)}
    generate_hash(datetime_of_clicks)
  end

  def user_clicks_table_hash
    month_user_clicks = ressources_clicked.last_30_days
                                          .map(&:user_id)
                                          .map{|id| User.find(id.to_i).name}
    unordered_hash = generate_hash(month_user_clicks)
  end

  def popular_ressources_hash
    popular_ressources = ressources_clicked.map{|event| event.properties["ressource_id"] }
                                           .map{|id| Ressource.find(id.to_i).title}
    unordered_hash = generate_hash(popular_ressources)
  end

  def generate_hash(ary)
    hash = Hash.new do |hash, key|
        hash[key] = 0
    end 

    ary.each do |entry|
      hash[entry] += 1
    end
    sort_hash_by_values(hash)
  end

  def sort_hash_by_values(hash)
    ordered_hash = Hash.new
    hash.keys.sort.each{|k| ordered_hash[hash.values_at(k)[0]] = k}
    ordered_hash.invert
  end
end
