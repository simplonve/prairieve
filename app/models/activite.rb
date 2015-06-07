class Activite < ActiveRecord::Base
  validates_uniqueness_of :title
  has_many :questions
  has_many :valides
  has_many :users, through: :valides 

  default_scope -> { order('id ASC') }
end
