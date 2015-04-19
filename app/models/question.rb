class Question < ActiveRecord::Base
  validates_uniqueness_of :desc

  def already_valid(user)
    self.valide.split.include? user.id.to_s
  end
end