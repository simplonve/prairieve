class AddDescToRessource < ActiveRecord::Migration
  def change
    add_column :ressources, :desc, :text
    add_column :ressources, :tags, :string
    add_column :ressources, :categorie, :string
    add_column :chapitres, :desc, :text
  end
end
