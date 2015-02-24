class StaticController < ApplicationController
  skip_filter :authenticate_user

  def stat
    @stat = Stat.generate_array
  end

  def welcome
  end
end
