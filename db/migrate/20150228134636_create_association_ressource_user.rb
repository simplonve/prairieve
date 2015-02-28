class CreateAssociationRessourceUser < ActiveRecord::Migration
  def change
    add_column :ressources, :user_id, :string
    add_index :ressources, [:user_id]
  end
end
