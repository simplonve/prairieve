class AddImportantToRessource < ActiveRecord::Migration
  def change
    add_column :ressources, :important, :boolean
  end
end
