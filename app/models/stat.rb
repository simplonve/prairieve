class Stat < ActiveRecord::Base
  validates :trace, presence: true
  scope :last_visited, -> { order('created_at DESC') }

  def self.create_for(user, ressource)
    trace = {user_id: user.id, user: user.name, ressource_id: ressource.id, ressource: ressource.title}
    create(trace: JSON.generate(trace))
  end

  def self.generate_array
    ary = []
    Stat.all.each{|stat| ary << JSON.parse(stat.trace)}
    ary
  end

  def self.ress_view_counter
    view_count = {}
    Ressource.all.each{|ress| view_count[ress.id] = 0}

    Stat.generate_array.each do |stat| 
      id = stat["ressource_id"]
      view_count[id] += 1
    end
    view_count
  end
end
