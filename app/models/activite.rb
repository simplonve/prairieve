class Activite < ActiveRecord::Base
  validates_uniqueness_of :title
  has_many :questions
  has_and_belongs_to_many :users

  default_scope -> { order('id ASC') }
end