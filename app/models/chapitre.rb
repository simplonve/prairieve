class Chapitre < ActiveRecord::Base
  validates_uniqueness_of :title
  has_many :ressources
end