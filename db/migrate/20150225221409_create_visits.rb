class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits, id: false do |t|
      t.binary :id, primary_key: true
      t.binary :visitor_id

      t.integer :user_id
      t.timestamp :started_at
    end

    add_index :visits, [:user_id]
  end
end
