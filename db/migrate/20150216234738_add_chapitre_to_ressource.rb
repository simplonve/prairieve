class AddChapitreToRessource < ActiveRecord::Migration
  def change
    add_reference :ressources, :chapitre, index: true
  end
end
