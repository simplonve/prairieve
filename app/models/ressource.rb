class Ressource < ActiveRecord::Base
  validates_uniqueness_of :title
  belongs_to :chapitre

  scope :lecture, ->  { where(categorie: "lecture") }
  scope :exercice, ->  { where(categorie: "exercice") }
  scope :bonus, ->  { where(categorie: "bonus") }
end