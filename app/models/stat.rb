class Stat < ActiveRecord::Base
  validates :trace, presence: true

  def self.create_for(user, ressource)
    trace = {user_id: user.id, user: user.name, ressource_id: ressource.id, ressource: ressource.title}
    create(trace: JSON.generate(trace))
  end

  def self.generate_array
    ary = []
    Stat.all.each do |stat|
      trace = JSON.parse(stat.trace)
      created_hash = {"created_at" => stat.created_at}
      trace.merge!(created_hash)
      ary << trace
    end

    ary
  end
end
