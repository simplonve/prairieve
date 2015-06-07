class CreateJoinTable < ActiveRecord::Migration
  def change
    create_table :valides do |t|
      t.belongs_to :user, index: true
      t.belongs_to :activite, index: true
    end
  end
end
