class Stat < ActiveRecord::Base
  validates :trace, presence: true

  def self.create_for(user, ressource)
    trace = {user_id: user.id, user: user.name, ressource_id: ressource.id, ressource: ressource.title}
    create(trace: JSON.generate(trace))
  end
end
