class AddMediaToRessource < ActiveRecord::Migration
  def change
    add_column :ressources, :media, :string
  end
end
