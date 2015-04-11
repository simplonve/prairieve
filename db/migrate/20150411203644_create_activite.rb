class CreateActivite < ActiveRecord::Migration
  def change
    create_table :activites do |t|
      t.string :title
      t.string :desc
      t.string :chapitre

      t.timestamps
    end
  end
end
