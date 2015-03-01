class Ressource < ActiveRecord::Base
  validates_presence_of :title, :url, :scope => :chapitre_id
  validates_uniqueness_of :title, :url, :scope => :chapitre_id
  belongs_to :chapitre
  belongs_to :user

  scope :lecture, ->  { where(categorie: "lecture") }
  scope :exercice, ->  { where(categorie: "exercice") }
  scope :activite, ->  { where(categorie: "activite") }
  scope :feedback, ->  { where(feedback: true) }
end
