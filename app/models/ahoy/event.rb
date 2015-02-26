module Ahoy
  class Event < ActiveRecord::Base
    self.primary_key = :id
    self.table_name = "ahoy_events"
    belongs_to :visit
    belongs_to :user

    serialize :properties, JSON
    
    scope :today, -> { where("time >= ?", Time.zone.now.beginning_of_day) }
    scope :ressources_clicked, -> { where(name: 'Ressource clicked') }
  end
end
