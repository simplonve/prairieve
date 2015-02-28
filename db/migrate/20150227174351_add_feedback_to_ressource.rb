class AddFeedbackToRessource < ActiveRecord::Migration
  def change
    add_column :ressources, :feedback, :boolean
  end
end
