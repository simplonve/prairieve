class Question < ActiveRecord::Base
  validates_uniqueness_of :desc
end