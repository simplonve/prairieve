class Ressource < ActiveRecord::Base
  validates_uniqueness_of :title
  belongs_to :chapitre
end