class Ressource < ActiveRecord::Base
  validates_presence_of :title, :url, :scope => :chapitre_id
  validates_uniqueness_of :title, :url, :scope => :chapitre_id
  belongs_to :chapitre
  belongs_to :user

  default_scope { order('(case when important then 1 else 0 end) DESC, created_at ASC')}
  scope :lecture, ->  { where(categorie: "lecture") }
  scope :exercice, ->  { where(categorie: "exercice") }
  scope :activite, ->  { where(categorie: "activite") }
  scope :feedback, ->  { where(feedback: true) }
end
