class ChangeQuestionDescToTextType < ActiveRecord::Migration
  def change
    change_column :questions, :desc, :text
    change_column :activites, :desc, :text
  end
end
