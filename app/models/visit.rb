class Visit < ActiveRecord::Base
  self.primary_key = :id
  has_many :ahoy_events, class_name: "Ahoy::Event"
  belongs_to :user
end
