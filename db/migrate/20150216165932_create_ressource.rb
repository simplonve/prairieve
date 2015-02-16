class CreateRessource < ActiveRecord::Migration
  def change
    create_table :ressources do |t|
      t.string :title
      t.string :url
      t.string :lang
      t.string :level
      t.integer :time

      t.timestamps
    end
  end
end
