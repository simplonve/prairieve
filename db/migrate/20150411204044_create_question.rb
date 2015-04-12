class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :desc
    end
    add_reference :questions, :activite, index: true
  end
end
