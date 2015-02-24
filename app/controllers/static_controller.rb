class StaticController < ApplicationController
  skip_filter :authenticate_user, only: [:welcome]

  def stat
    @raw_stat = Stat.last_visited.limit(10)
    @stat = Stat.ress_view_counter
    @ressources = Ressource.all
  end

  def welcome
  end
end
