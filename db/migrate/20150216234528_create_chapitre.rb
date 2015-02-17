class CreateChapitre < ActiveRecord::Migration
  def change
    create_table :chapitres do |t|
      t.string :title
      t.string :intro

      t.timestamps
    end
  end
end
