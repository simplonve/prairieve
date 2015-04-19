class AddToValideToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :valide, :string, default: ""
  end
end
