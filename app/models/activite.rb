class Activite < ActiveRecord::Base
  validates_uniqueness_of :title
  has_many :questions
  has_many :valides
  has_many :users, through: :valides 

  default_scope -> { order('id ASC') }

  def total_invalide(user)
    question_valides = self.questions.group_by{|qu|  qu.already_valid(user)}[true]
    if question_valides
      self.questions.count - question_valides.count 
    else
      0
    end
  end
end
