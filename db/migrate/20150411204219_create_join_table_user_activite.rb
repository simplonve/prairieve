class CreateJoinTableUserActivite < ActiveRecord::Migration
  def change
    create_join_table :users, :activites do |t|
      t.index [:user_id, :activite_id]
      t.index [:activite_id, :user_id]
    end
  end
end
