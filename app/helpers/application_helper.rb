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

  def pie_chart_helper
    @pie_chart = {}
    today_ressource_ids = Ahoy::Event.today
                                     .ressources_clicked
                                     .map{|event| event.properties["ressource_id"]}

    today_ressource_ids.each do |id|
       @pie_chart[find_ressource(id)] ||= 0
       @pie_chart[find_ressource(id)] += 1 
    end 

    @pie_chart
  end

  def find_ressource(id)
    Ressource.find(id.to_i).title
  end
end
