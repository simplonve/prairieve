module Ahoy
  class Event < ActiveRecord::Base
    self.primary_key = :id
    self.table_name = "ahoy_events"
    belongs_to :visit
    belongs_to :user

    serialize :properties, JSON
    
    scope :ressources_clicked, -> { where(name: 'Ressource clicked') }
    scope :today, -> { where("time >= ?", Time.zone.now.beginning_of_day) }
    scope :last_7_days, -> { where("time >= ?", 7.day.ago) }
    scope :last_30_days, -> { where("time >= ?", 30.day.ago) }
  end
end
