class CreateStat < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.text :trace
      
      t.timestamps
    end
  end
end
