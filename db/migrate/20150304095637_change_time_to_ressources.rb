class ChangeTimeToRessources < ActiveRecord::Migration
  def change
    change_column :ressources, :time, :string
  end
end
